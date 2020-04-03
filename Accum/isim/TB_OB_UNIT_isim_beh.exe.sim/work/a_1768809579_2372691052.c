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
static const char *ng0 = "E:/Master Degree/PCSUPL/Accum/TB_OB_UNIT.vhd";
extern char *WORK_P_0606889405;



void work_a_1768809579_2372691052_sub_785038507_4163069965(char *t0, char *t1, char *t2, char *t3, unsigned int t4, unsigned int t5, char *t6, char *t7, unsigned int t8, unsigned int t9, char *t10)
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
    int64 t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 3;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 3);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t15 = (t18 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 3;
    t19 = (t15 + 4U);
    *((int *)t19) = 0;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 3);
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
    memcpy(t26, t2, 4U);
    xsi_driver_first_trans_delta(t6, t17, 4U, 0LL);
    t14 = (t0 + 2448U);
    t15 = *((char **)t14);
    t27 = *((int64 *)t15);
    xsi_process_wait(t1, t27);

LAB7:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t28 = (t26 + 0U);
    getcontext(t28);
    t29 = (t1 + 88U);
    t30 = *((char **)t29);
    t31 = (t30 + 2480U);
    t17 = *((unsigned int *)t31);
    if (t17 == 1)
        goto LAB8;

LAB9:    t32 = (t1 + 88U);
    t33 = *((char **)t32);
    t34 = (t33 + 2480U);
    *((unsigned int *)t34) = 3U;

LAB5:
LAB6:
LAB4:    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);
    t14 = (t0 + 2448U);
    t15 = *((char **)t14);
    t27 = *((int64 *)t15);
    xsi_process_wait(t1, t27);

LAB13:    t14 = (t1 + 88U);
    t23 = *((char **)t14);
    t24 = (t23 + 2480U);
    *((unsigned int *)t24) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t28 = (t26 + 0U);
    getcontext(t28);
    t29 = (t1 + 88U);
    t30 = *((char **)t29);
    t31 = (t30 + 2480U);
    t17 = *((unsigned int *)t31);
    if (t17 == 1)
        goto LAB14;

LAB15:    t32 = (t1 + 88U);
    t33 = *((char **)t32);
    t34 = (t33 + 2480U);
    *((unsigned int *)t34) = 3U;

LAB11:
LAB12:
LAB10:    t17 = (0 + t8);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, t17, 1, 0LL);

LAB1:    return;
LAB3:    *((char **)t19) = t2;
    goto LAB2;

LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

LAB14:    xsi_saveStackAndSuspend(t1);
    goto LAB15;

}

static void work_a_1768809579_2372691052_p_0(char *t0)
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

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(104, ng0);
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

static void work_a_1768809579_2372691052_p_1(char *t0)
{
    char t11[8];
    char t17[8];
    char t18[8];
    char t19[8];
    char t20[8];
    char t21[8];
    char t22[8];
    char t23[8];
    char t24[8];
    char t25[8];
    char t26[8];
    char t27[8];
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
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;

LAB0:    t1 = (t0 + 3680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t4);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t4);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 6672);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 6680);
    t6 = (t0 + 4256);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1768U);
    t6 = *((char **)t3);
    memcpy(t11, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t11, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB18;

LAB19:    t12 = (unsigned char)0;

LAB20:    if (t12 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2008U);
    t6 = *((char **)t3);
    memcpy(t17, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t17, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB23;

LAB24:    t12 = (unsigned char)0;

LAB25:    if (t12 == 0)
        goto LAB21;

LAB22:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2128U);
    t6 = *((char **)t3);
    memcpy(t18, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t18, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB28;

LAB29:    t12 = (unsigned char)0;

LAB30:    if (t12 == 0)
        goto LAB26;

LAB27:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1888U);
    t6 = *((char **)t3);
    memcpy(t19, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t19, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB33;

LAB34:    t12 = (unsigned char)0;

LAB35:    if (t12 == 0)
        goto LAB31;

LAB32:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 6792);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1768U);
    t6 = *((char **)t3);
    memcpy(t20, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t20, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB38;

LAB39:    t12 = (unsigned char)0;

LAB40:    if (t12 == 0)
        goto LAB36;

LAB37:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2008U);
    t6 = *((char **)t3);
    memcpy(t21, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t21, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB43;

LAB44:    t12 = (unsigned char)0;

LAB45:    if (t12 == 0)
        goto LAB41;

LAB42:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2128U);
    t6 = *((char **)t3);
    memcpy(t22, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t22, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB48;

LAB49:    t12 = (unsigned char)0;

LAB50:    if (t12 == 0)
        goto LAB46;

LAB47:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1888U);
    t6 = *((char **)t3);
    memcpy(t23, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t23, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB53;

LAB54:    t12 = (unsigned char)0;

LAB55:    if (t12 == 0)
        goto LAB51;

LAB52:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 6900);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1768U);
    t6 = *((char **)t3);
    memcpy(t24, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t24, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB58;

LAB59:    t12 = (unsigned char)0;

LAB60:    if (t12 == 0)
        goto LAB56;

LAB57:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2008U);
    t6 = *((char **)t3);
    memcpy(t25, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t25, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB63;

LAB64:    t12 = (unsigned char)0;

LAB65:    if (t12 == 0)
        goto LAB61;

LAB62:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 2128U);
    t6 = *((char **)t3);
    memcpy(t26, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t26, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB68;

LAB69:    t12 = (unsigned char)0;

LAB70:    if (t12 == 0)
        goto LAB66;

LAB67:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 3488);
    t3 = ((WORK_P_0606889405) + 1888U);
    t6 = *((char **)t3);
    memcpy(t27, t6, 4U);
    t3 = (t0 + 1792U);
    t7 = (t0 + 4320);
    t8 = (t0 + 1312U);
    t9 = (t0 + 4384);
    work_a_1768809579_2372691052_sub_785038507_4163069965(t0, t2, t27, t3, 0U, 0U, t7, t8, 0U, 0U, t9);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB73;

LAB74:    t12 = (unsigned char)0;

LAB75:    if (t12 == 0)
        goto LAB71;

LAB72:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t4);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    t2 = (t0 + 6688);
    xsi_report(t2, 26U, (unsigned char)3);
    goto LAB17;

LAB18:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)3);
    t12 = t16;
    goto LAB20;

LAB21:    t2 = (t0 + 6714);
    xsi_report(t2, 26U, (unsigned char)3);
    goto LAB22;

LAB23:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB25;

LAB26:    t2 = (t0 + 6740);
    xsi_report(t2, 26U, (unsigned char)3);
    goto LAB27;

LAB28:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)3);
    t12 = t16;
    goto LAB30;

LAB31:    t2 = (t0 + 6766);
    xsi_report(t2, 26U, (unsigned char)3);
    goto LAB32;

LAB33:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB35;

LAB36:    t2 = (t0 + 6800);
    xsi_report(t2, 25U, (unsigned char)3);
    goto LAB37;

LAB38:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB40;

LAB41:    t2 = (t0 + 6825);
    xsi_report(t2, 25U, (unsigned char)3);
    goto LAB42;

LAB43:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB45;

LAB46:    t2 = (t0 + 6850);
    xsi_report(t2, 25U, (unsigned char)3);
    goto LAB47;

LAB48:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB50;

LAB51:    t2 = (t0 + 6875);
    xsi_report(t2, 25U, (unsigned char)3);
    goto LAB52;

LAB53:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB55;

LAB56:    t2 = (t0 + 6908);
    xsi_report(t2, 28U, (unsigned char)3);
    goto LAB57;

LAB58:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB60;

LAB61:    t2 = (t0 + 6936);
    xsi_report(t2, 28U, (unsigned char)3);
    goto LAB62;

LAB63:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB65;

LAB66:    t2 = (t0 + 6964);
    xsi_report(t2, 28U, (unsigned char)3);
    goto LAB67;

LAB68:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB70;

LAB71:    t2 = (t0 + 6992);
    xsi_report(t2, 28U, (unsigned char)3);
    goto LAB72;

LAB73:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB75;

LAB76:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 7020);
    xsi_report(t2, 17U, (unsigned char)3);
    goto LAB2;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

}


extern void work_a_1768809579_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1768809579_2372691052_p_0,(void *)work_a_1768809579_2372691052_p_1};
	static char *se[] = {(void *)work_a_1768809579_2372691052_sub_785038507_4163069965};
	xsi_register_didat("work_a_1768809579_2372691052", "isim/TB_OB_UNIT_isim_beh.exe.sim/work/a_1768809579_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
