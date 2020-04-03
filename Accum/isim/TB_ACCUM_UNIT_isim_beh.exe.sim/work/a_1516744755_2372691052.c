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
static const char *ng0 = "E:/Master Degree/PCSUPL/Accum/TB_ACCUM_UNIT.vhd";



void work_a_1516744755_2372691052_sub_2997101772_4163069965(char *t0, char *t1, char *t2, unsigned int t3, unsigned int t4, char *t5)
{
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 2448U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB5:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB6;

LAB7:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB3:
LAB4:
LAB2:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 2448U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB11:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB12;

LAB13:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB9:
LAB10:
LAB8:    t8 = (0 + t3);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t5, t8, 1, 0LL);
    t9 = (t0 + 2448U);
    t10 = *((char **)t9);
    t13 = *((int64 *)t10);
    xsi_process_wait(t1, t13);

LAB17:    t9 = (t1 + 88U);
    t11 = *((char **)t9);
    t12 = (t11 + 2480U);
    *((unsigned int *)t12) = 1U;
    t14 = (t1 + 88U);
    t15 = *((char **)t14);
    t16 = (t15 + 0U);
    getcontext(t16);
    t17 = (t1 + 88U);
    t18 = *((char **)t17);
    t19 = (t18 + 2480U);
    t8 = *((unsigned int *)t19);
    if (t8 == 1)
        goto LAB18;

LAB19:    t20 = (t1 + 88U);
    t21 = *((char **)t20);
    t22 = (t21 + 2480U);
    *((unsigned int *)t22) = 3U;

LAB15:
LAB16:
LAB14:
LAB1:    return;
LAB6:    xsi_saveStackAndSuspend(t1);
    goto LAB7;

LAB12:    xsi_saveStackAndSuspend(t1);
    goto LAB13;

LAB18:    xsi_saveStackAndSuspend(t1);
    goto LAB19;

}

void work_a_1516744755_2372691052_sub_990416161_4163069965(char *t0, char *t1, char *t2, char *t3, unsigned int t4, unsigned int t5, char *t6, char *t7, unsigned int t8, unsigned int t9, char *t10)
{
    char t12[24];
    char t13[16];
    char t18[16];
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    char *t19;
    int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    int64 t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 1;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 1);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t15 = (t18 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 1;
    t19 = (t15 + 4U);
    *((int *)t19) = 0;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 1);
    t17 = (t20 * -1);
    t17 = (t17 + 1);
    t19 = (t15 + 12U);
    *((unsigned int *)t19) = t17;
    t19 = (t12 + 4U);
    t21 = (t2 != 0);
    if (t21 == 1)
        goto LAB3;

LAB2:    t22 = (t12 + 12U);
    *((char **)t22) = t13;
    t17 = (0 + t4);
    t23 = (t6 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t18 + 12U);
    t28 = *((unsigned int *)t27);
    t28 = (t28 * 1U);
    memcpy(t26, t2, t28);
    t29 = (t18 + 12U);
    t30 = *((unsigned int *)t29);
    t31 = (1U * t30);
    xsi_driver_first_trans_delta(t6, t17, t31, 0LL);
    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 2448U);
    t15 = *((char **)t14);
    t32 = *((int64 *)t15);
    xsi_process_wait(t1, t32);

LAB7:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    getcontext(t27);
    t29 = (t1 + 88U);
    t33 = *((char **)t29);
    t34 = (t33 + 2480U);
    t17 = *((unsigned int *)t34);
    if (t17 == 1)
        goto LAB8;

LAB9:    t35 = (t1 + 88U);
    t36 = *((char **)t35);
    t37 = (t36 + 2480U);
    *((unsigned int *)t37) = 3U;

LAB5:
LAB6:
LAB4:    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 2448U);
    t15 = *((char **)t14);
    t32 = *((int64 *)t15);
    xsi_process_wait(t1, t32);

LAB13:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    getcontext(t27);
    t29 = (t1 + 88U);
    t33 = *((char **)t29);
    t34 = (t33 + 2480U);
    t17 = *((unsigned int *)t34);
    if (t17 == 1)
        goto LAB14;

LAB15:    t35 = (t1 + 88U);
    t36 = *((char **)t35);
    t37 = (t36 + 2480U);
    *((unsigned int *)t37) = 3U;

LAB11:
LAB12:
LAB10:
LAB1:    return;
LAB3:    *((char **)t19) = t2;
    goto LAB2;

LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

LAB14:    xsi_saveStackAndSuspend(t1);
    goto LAB15;

}

static void work_a_1516744755_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1516744755_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;

LAB0:    t1 = (t0 + 3680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 1152U);
    t6 = (t0 + 4128);
    work_a_1516744755_2372691052_sub_2997101772_4163069965(t0, t2, t3, 0U, 0U, t6);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 6760);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 6768);
    t6 = (t0 + 4256);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 4320);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 6776);
    t7 = (t0 + 1312U);
    t8 = (t0 + 4384);
    t9 = (t0 + 1472U);
    t10 = (t0 + 4448);
    work_a_1516744755_2372691052_sub_990416161_4163069965(t0, t2, t3, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t11 = 1;
    if (8U == 8U)
        goto LAB14;

LAB15:    t11 = 0;

LAB16:    if (t11 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4320);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 6808);
    t7 = (t0 + 1312U);
    t8 = (t0 + 4384);
    t9 = (t0 + 1472U);
    t10 = (t0 + 4448);
    work_a_1516744755_2372691052_sub_990416161_4163069965(t0, t2, t3, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 6810);
    t11 = 1;
    if (8U == 8U)
        goto LAB22;

LAB23:    t11 = 0;

LAB24:    if (t11 == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 6848);
    t7 = (t0 + 1312U);
    t8 = (t0 + 4384);
    t9 = (t0 + 1472U);
    t10 = (t0 + 4448);
    work_a_1516744755_2372691052_sub_990416161_4163069965(t0, t2, t3, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t11 = 1;
    if (8U == 8U)
        goto LAB30;

LAB31:    t11 = 0;

LAB32:    if (t11 == 0)
        goto LAB28;

LAB29:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4320);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 6879);
    t7 = (t0 + 1312U);
    t8 = (t0 + 4384);
    t9 = (t0 + 1472U);
    t10 = (t0 + 4448);
    work_a_1516744755_2372691052_sub_990416161_4163069965(t0, t2, t3, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 6881);
    t11 = 1;
    if (8U == 8U)
        goto LAB38;

LAB39:    t11 = 0;

LAB40:    if (t11 == 0)
        goto LAB36;

LAB37:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 3488);
    t3 = (t0 + 6919);
    t7 = (t0 + 1312U);
    t8 = (t0 + 4384);
    t9 = (t0 + 1472U);
    t10 = (t0 + 4448);
    work_a_1516744755_2372691052_sub_990416161_4163069965(t0, t2, t3, t7, 0U, 0U, t8, t9, 0U, 0U, t10);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 6921);
    t11 = 1;
    if (8U == 8U)
        goto LAB46;

LAB47:    t11 = 0;

LAB48:    if (t11 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 6960);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t8 = (t0 + 6778);
    xsi_report(t8, 30U, 2);
    goto LAB13;

LAB14:    t12 = 0;

LAB17:    if (t12 < 8U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t2 = (t3 + t12);
    t7 = (t6 + t12);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB15;

LAB19:    t12 = (t12 + 1);
    goto LAB17;

LAB20:    t9 = (t0 + 6818);
    xsi_report(t9, 30U, 2);
    goto LAB21;

LAB22:    t12 = 0;

LAB25:    if (t12 < 8U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t7 = (t3 + t12);
    t8 = (t2 + t12);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB23;

LAB27:    t12 = (t12 + 1);
    goto LAB25;

LAB28:    t8 = (t0 + 6850);
    xsi_report(t8, 29U, 2);
    goto LAB29;

LAB30:    t12 = 0;

LAB33:    if (t12 < 8U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t2 = (t3 + t12);
    t7 = (t6 + t12);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB31;

LAB35:    t12 = (t12 + 1);
    goto LAB33;

LAB36:    t9 = (t0 + 6889);
    xsi_report(t9, 30U, 2);
    goto LAB37;

LAB38:    t12 = 0;

LAB41:    if (t12 < 8U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t7 = (t3 + t12);
    t8 = (t2 + t12);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB39;

LAB43:    t12 = (t12 + 1);
    goto LAB41;

LAB44:    t9 = (t0 + 6929);
    xsi_report(t9, 31U, 2);
    goto LAB45;

LAB46:    t12 = 0;

LAB49:    if (t12 < 8U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t7 = (t3 + t12);
    t8 = (t2 + t12);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB47;

LAB51:    t12 = (t12 + 1);
    goto LAB49;

}


extern void work_a_1516744755_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1516744755_2372691052_p_0,(void *)work_a_1516744755_2372691052_p_1};
	static char *se[] = {(void *)work_a_1516744755_2372691052_sub_2997101772_4163069965,(void *)work_a_1516744755_2372691052_sub_990416161_4163069965};
	xsi_register_didat("work_a_1516744755_2372691052", "isim/TB_ACCUM_UNIT_isim_beh.exe.sim/work/a_1516744755_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
