#include "stdio.h"
#include "xgpiops.h"
#include "sleep.h"

#include "SCCB_drv.h"

extern XGpioPs 		SccbInstancePtr;
extern XGpioPs_Config* SccbConfigPtr;

uint8_t SCCB_InitPorts(void)
{
	SccbConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	if(SccbConfigPtr == NULL)
	{
		return XST_DEVICE_NOT_FOUND;
	}

	int xStatus = XGpioPs_CfgInitialize(&SccbInstancePtr,SccbConfigPtr, SccbConfigPtr->BaseAddr);
	if(XST_SUCCESS != xStatus)
	{
		return XST_FAILURE;
	}

	XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SCL, OUTPUT);
	XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SDA, OUTPUT);
	XGpioPs_WritePin(&SCCB_OBJ, SCCB_SCL, HIGH);
	XGpioPs_WritePin(&SCCB_OBJ, SCCB_SDA, HIGH);

	XGpioPs_WritePin(&SCCB_OBJ, SCCB_SCL, LOW);
	XGpioPs_WritePin(&SCCB_OBJ, SCCB_SDA, LOW);

	//XGpioPs_WritePin(&SCCB_OBJ, SCCB_SCL, HIGH);
	//XGpioPs_WritePin(&SCCB_OBJ, SCCB_SDA, HIGH);

	return XST_SUCCESS;
}

// ---------------------------------------------------------------------------------------- //

/*!
 *  @brief      SCCB��ʼ�ź�
 *  @since      v5.0
 */
static uint8_t SCCB_Start(void)
{
    SDA_H();
    SCL_H();
    SCCB_DELAY();

    SDA_DDR_IN();
    if(!SDA_IN())
    {
        SDA_DDR_OUT();
        return 0;   /* SDA��Ϊ�͵�ƽ������æ,�˳� */
    }
    SDA_DDR_OUT();
    SDA_L();

    SCCB_DELAY();
    SCL_L();

    if(SDA_IN())
    {
        SDA_DDR_OUT();
        return 0;   /* SDA��Ϊ�ߵ�ƽ�����߳���,�˳� */
    }

    return 1;
}

/*!
 *  @brief      SCCBֹͣ�ź�
 *  @since      v5.0
 */
static void SCCB_Stop(void)
{
    SCL_L();
    //SCCB_DELAY();
    SDA_L();
    SCCB_DELAY();
    SCL_H();
    SCCB_DELAY();
    SDA_H();
    SCCB_DELAY();
}

/*!
 *  @brief      SCCBӦ���ź�
 *  @since      v5.0
 */
static void SCCB_Ack(void)
{
    SCL_L();
    SCCB_DELAY();
    SDA_L();
    SCCB_DELAY();
    SCL_H();
    SCCB_DELAY();
    SCL_L();
    SCCB_DELAY();
}

/*!
 *  @brief      SCCB��Ӧ���ź�
 *  @since      v5.0
 */
static void SCCB_NoAck(void)
{
    SCL_L();
    SCCB_DELAY();
    SDA_H();
    SCCB_DELAY();
    SCL_H();
    SCCB_DELAY();
    SCL_L();
    SCCB_DELAY();
}

/*!
 *  @brief      SCCB �ȴ�Ӧ��
 *  @return     Ӧ������0��ʾ��Ӧ��1��ʾ��Ӧ��
 *  @since      v5.0
 */
static int SCCB_WaitAck(void)
{
    SCL_L();
    //SDA_H();
    SDA_DDR_IN();

    SCCB_DELAY();
    SCL_H();

    SCCB_DELAY();

    if(SDA_IN())           //Ӧ��Ϊ�ߵ�ƽ���쳣��ͨ��ʧ��
    {
        SDA_DDR_OUT();
        SCL_L();
        return 0;
    }
    SDA_DDR_OUT();
    SCL_L();
    return 1;
}

/*!
 *  @brief      SCCB ���͵�����
 *  @param      SendByte    ��Ҫ���͵�����
 *  @since      v5.0
 */
static void SCCB_SendByte(uint8_t SendByte)
{
    uint8_t i = 8;
    while(i--)
    {

        if(SendByte & 0x80)     //SDA �������
        {
            SDA_H();
        }
        else
        {
            SDA_L();
        }
        SendByte <<= 1;
        SCCB_DELAY();
        SCL_H();                //SCL ���ߣ��ɼ��ź�
        SCCB_DELAY();
        SCL_L();                //SCL ʱ��������
        //SCCB_DELAY();
    }
    //SCL_L();
}

/*!
 *  @brief      ����SCCB���ߵ�����
 *  @return     ���յ�������
 *  @since      v5.0
 */
static int SCCB_ReceiveByte(void)
{
    uint8_t i = 8;
    uint8_t ReceiveByte = 0;

    //SDA_H();
    //SCCB_DELAY();
    SDA_DDR_IN();

    while(i--)
    {
        ReceiveByte <<= 1;
        SCL_L();
        SCCB_DELAY();
        SCL_H();
        SCCB_DELAY();

        if(SDA_IN())
        {
            ReceiveByte |= 0x01;
        }
    }
    SDA_DDR_OUT();
    SCL_L();
    return ReceiveByte;
}

// ---------------------------------------------------------------------------------------- //

int16_t SCCB_WriteByte_soft(uint8_t SlaveAddress, uint8_t REG_Address, uint8_t REG_data)
{
    if(!SCCB_Start())
    {
        return 0;
    }
    SCCB_SendByte( SlaveAddress<<1|0 );                    /* ������ַ */
    if(!SCCB_WaitAck())
    {
        SCCB_Stop();
        return 0;
    }
    SCCB_SendByte((uint8_t)(REG_Address & 0x00FF));   /* ���õ���ʼ��ַ */
    SCCB_WaitAck();
    SCCB_SendByte(REG_data);
    SCCB_WaitAck();
    SCCB_Stop();
    return 1;
}

int16_t SCCB_ReadByte_soft(uint8_t SlaveAddress, uint8_t REG_Address)
{
    uint8_t pBuffer = 0;

    if(!SCCB_Start())
    {
        return 0;
    }
    SCCB_SendByte(SlaveAddress<<1|0);         /* ������ַ */
    if(!SCCB_WaitAck())
    {
        SCCB_Stop();
        return 0;
    }
    SCCB_SendByte(REG_Address);           /* ���õ���ʼ��ַ */
    SCCB_WaitAck();
    SCCB_Stop();

    if(!SCCB_Start())
    {
        return 0;
    }
    SCCB_SendByte(SlaveAddress<<1|1);               /* ������ַ */

    if(!SCCB_WaitAck())
    {
        SCCB_Stop();
        return 0;
    }
    // while(length)
    // {
    //     *pBuffer = SCCB_ReceiveByte();
    //     if(length == 1)
    //     {
    //         SCCB_NoAck();
    //     }
    //     else
    //     {
    //         SCCB_Ack();
    //     }
    //     pBuffer++;
    //     length--;
    // }

    pBuffer = SCCB_ReceiveByte();       // ֻ��һ������
    SCCB_NoAck();

    SCCB_Stop();

    return pBuffer;
}