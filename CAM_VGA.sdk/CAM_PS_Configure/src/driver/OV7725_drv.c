#include "stdio.h"

#include "sleep.h"

#include "SCCB_drv.h"
#include "OV7725_reg.h"
#include "OV7725_drv.h"

reg_s   OV7725_Eagle_reg[];
uint8_t OV7725_Eagle_cfgnum;

uint8_t OV7725_Eagle_reg_Init(void)
{
    uint16_t i = 0;
    uint8_t Sensor_IDCode = 0;

    SCCB_WriteByte_soft(OV7725_ADDR, OV7725_COM7, 0x80);
    OV7725_EAGLE_Delay_ms(20);
    Sensor_IDCode = SCCB_ReadByte_soft(OV7725_ADDR, OV7725_VER);

    printf("\nGet ID success，SENSOR ID is 0x%x", Sensor_IDCode);
    printf("\nConfig Register Number is %d ", OV7725_Eagle_cfgnum);

    OV7725_EAGLE_Delay_ms(10);

    if(Sensor_IDCode == OV7725_ID)
    {
        for( i = 0 ; i < OV7725_Eagle_cfgnum ; i++ )
        {
            SCCB_WriteByte_soft(OV7725_ADDR, OV7725_Eagle_reg[i].Addr, OV7725_Eagle_reg[i].val);

            OV7725_EAGLE_Delay_ms(2);
        }
    }
    else
    {
        OV7725_Eagle_reg_Init();                // 递归调用自己，重复配置7725直到成功
        return 0;
    }
    printf("\nOV7725 Register Configure Success!");
    return 1;
}

/*OV7725初始化配置表*/
reg_s OV7725_Eagle_reg[] =
{
    //寄存器，寄存器值次
    {OV7725_COM4         , 0xC1},       // 50fps
    {OV7725_CLKRC        , 0x01},
    {OV7725_COM2         , 0x03},
    {OV7725_COM3         , 0xD0},       // D0
    {OV7725_COM7         , 0x06},       // VGA, rgb565, RGB
    //{OV7725_COM8         , 0xFF},       // 自动增益/工频滤波设置
    //{OV7725_BDBase       , 0x98},
    //{OV7725_BDMStep      , 0x03},
	{OV7725_COM10		 , 0x00},

    //{OV7725_HSTART       , 0x3F},
    //{OV7725_HSIZE        , 0x50},
    //{OV7725_VSTRT        , 0x03},
    //{OV7725_VSIZE        , 0x78},
    //{OV7725_HREF         , 0x00},
    //{OV7725_SCAL0        , 0x0A},
    //{OV7725_AWB_Ctrl0    , 0xE0},
    //{OV7725_DSPAuto      , 0xff},
    //{OV7725_DSP_Ctrl2    , 0x0C},
    //{OV7725_DSP_Ctrl3    , 0x00},
    //{OV7725_DSP_Ctrl4    , 0x00},
    //{OV7725_HOutSize     , 0x14},
    //{OV7725_VOutSize     , 0x1E},
    /*{OV7725_EXHCH        , 0x00},
    {OV7725_GAM1         , 0x0c},
    {OV7725_GAM2         , 0x16},
    {OV7725_GAM3         , 0x2a},
    {OV7725_GAM4         , 0x4e},
    {OV7725_GAM5         , 0x61},
    {OV7725_GAM6         , 0x6f},
    {OV7725_GAM7         , 0x7b},
    {OV7725_GAM8         , 0x86},
    {OV7725_GAM9         , 0x8e},
    {OV7725_GAM10        , 0x97},
    {OV7725_GAM11        , 0xa4},
    {OV7725_GAM12        , 0xaf},
    {OV7725_GAM13        , 0xc5},
    {OV7725_GAM14        , 0xd7},
    {OV7725_GAM15        , 0xe8},
    {OV7725_SLOP         , 0x20},
    {OV7725_LC_RADI      , 0x00},
    {OV7725_LC_COEF      , 0x13},
    {OV7725_LC_XC        , 0x08},
    {OV7725_LC_COEFB     , 0x14},
    {OV7725_LC_COEFR     , 0x17},
    {OV7725_LC_CTR       , 0x05},
    {OV7725_SDE          , 0x04},
    {OV7725_BRIGHT       , 0x00},
    {OV7725_CNST         , 0xFF},
    {OV7725_SIGN         , 0x06},
    {OV7725_UVADJ0       , 0x11},
    {OV7725_UVADJ1       , 0x02},*/

};

uint8_t OV7725_Eagle_cfgnum = sizeof(OV7725_Eagle_reg)/sizeof(OV7725_Eagle_reg[0]); /*结构体数组成员数目*/
