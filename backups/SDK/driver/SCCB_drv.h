#ifndef _SCCB_DRV_H_
#define _SCCB_DRV_H_

// #include "xgpiops.h"

//SCCB �ܽ�����
#define SCCB_OBJ		SccbInstancePtr
#define SCCB_SCL        54	//T16
#define SCCB_SDA        55	//M19

#define HIGH 			1
#define LOW  			0

#define INPUT			0
#define OUTPUT			1

#define SCL_H()         XGpioPs_WritePin(&SCCB_OBJ, SCCB_SCL, HIGH)
#define SCL_L()         XGpioPs_WritePin(&SCCB_OBJ, SCCB_SCL, LOW)
#define SCL_DDR_OUT()   do{XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SCL, OUTPUT);}while(0)
#define SCL_DDR_IN()    do{XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SCL, INPUT);}while(0)

#define SDA_H()         XGpioPs_WritePin(&SCCB_OBJ, SCCB_SDA, HIGH)
#define SDA_L()         XGpioPs_WritePin(&SCCB_OBJ, SCCB_SDA, LOW)
#define SDA_IN()        XGpioPs_ReadPin(&SCCB_OBJ, SCCB_SDA)
#define SDA_DDR_OUT()   do{XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SDA, OUTPUT);}while(0)
#define SDA_DDR_IN()    do{XGpioPs_SetDirectionPin(&SCCB_OBJ, SCCB_SDA, INPUT);}while(0)

#define SCCB_DELAY()	usleep(400)

extern uint8_t SCCB_InitPorts(void);
extern int16_t SCCB_WriteByte_soft(uint8_t SlaveAddress, uint8_t REG_Address, uint8_t REG_data);
extern int16_t SCCB_ReadByte_soft(uint8_t SlaveAddress, uint8_t REG_Address);

#endif
