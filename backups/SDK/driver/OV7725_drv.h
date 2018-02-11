#ifndef _OV7725_DRV_H_
#define _OV7725_DRV_H_

#define OV7725_EAGLE_Delay_ms(ms)  usleep(ms*1000)

typedef struct
{
    uint8_t Addr;                 /*¼Ä´æÆ÷µØÖ·*/
    uint8_t val;                   /*¼Ä´æÆ÷Öµ*/
} reg_s;

extern uint8_t OV7725_Eagle_reg_Init(void);

#endif
