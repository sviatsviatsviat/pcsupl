/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Master Degree/PCSUPL/GPR/TB_REGA_UNIT.vhd";



static void work_a_4005193083_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 0U, 1, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2280);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2280);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4005193083_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    int64 t10;
    unsigned char t11;
    unsigned int t12;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    char *t17;
    unsigned char t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    t1 = (t0 + 2720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 2U, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 1U, 1, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 5028);
    t4 = (t0 + 3168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_delta(t4, 3U, 8U, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 5036);
    t4 = (t0 + 3168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_delta(t4, 11U, 8U, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t10 = (t9 / 2);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t10);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 1U, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t9);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 1U, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t9);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 2U, 1, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t9);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 3168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 2U, 1, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t12 = (0 + 0U);
    t2 = (t3 + t12);
    t4 = (t0 + 5044);
    t13 = 1;
    if (8U == 8U)
        goto LAB25;

LAB26:    t13 = 0;

LAB27:    if (t13 == 1)
        goto LAB22;

LAB23:    t11 = (unsigned char)0;

LAB24:    if (t11 == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 2528);
    xsi_process_wait(t2, t9);

LAB39:    *((char **)t1) = &&LAB40;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    t23 = (t0 + 5060);
    xsi_report(t23, 11U, (unsigned char)3);
    goto LAB21;

LAB22:    t8 = (t0 + 1192U);
    t15 = *((char **)t8);
    t16 = (0 + 8U);
    t8 = (t15 + t16);
    t17 = (t0 + 5052);
    t19 = 1;
    if (8U == 8U)
        goto LAB31;

LAB32:    t19 = 0;

LAB33:    t11 = t19;
    goto LAB24;

LAB25:    t14 = 0;

LAB28:    if (t14 < 8U)
        goto LAB29;
    else
        goto LAB27;

LAB29:    t6 = (t2 + t14);
    t7 = (t4 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB26;

LAB30:    t14 = (t14 + 1);
    goto LAB28;

LAB31:    t20 = 0;

LAB34:    if (t20 < 8U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t21 = (t8 + t20);
    t22 = (t17 + t20);
    if (*((unsigned char *)t21) != *((unsigned char *)t22))
        goto LAB32;

LAB36:    t20 = (t20 + 1);
    goto LAB34;

LAB37:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 5071);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB2;

LAB38:    goto LAB37;

LAB40:    goto LAB38;

}


extern void work_a_4005193083_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4005193083_2372691052_p_0,(void *)work_a_4005193083_2372691052_p_1};
	xsi_register_didat("work_a_4005193083_2372691052", "isim/TB_REGA_UNIT_isim_beh.exe.sim/work/a_4005193083_2372691052.didat");
	xsi_register_executes(pe);
}
