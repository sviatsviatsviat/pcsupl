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
static const char *ng0 = "E:/Master Degree/PCSUPL/Accum/ROM_IF.vhd";
extern char *WORK_P_0606889405;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_1142784088_3212880686_p_0(char *t0)
{
    char t7[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 6080);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(53, ng0);
    t1 = ((WORK_P_0606889405) + 2608U);
    t5 = *((char **)t1);
    t1 = ((WORK_P_0606889405) + 2728U);
    t6 = *((char **)t1);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = ((WORK_P_0606889405) + 2616);
    t9 = *((char **)t9);
    t10 = ((WORK_P_0606889405) + 2736);
    t10 = *((char **)t10);
    t1 = xsi_base_array_concat(t1, t7, t8, (char)97, t5, t9, (char)97, t6, t10, (char)101);
    t11 = (4U + 8U);
    t12 = (12U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 6256);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 12U);
    xsi_driver_first_trans_fast(t13);
    goto LAB3;

LAB5:    xsi_size_not_matching(12U, t11, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 992U);
    t12 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t12 != 0)
        goto LAB9;

LAB11:
LAB10:    goto LAB3;

LAB9:    xsi_set_current_line(56, ng0);
    t5 = (t0 + 2152U);
    t6 = *((char **)t5);
    t5 = (t0 + 6256);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t13 = *((char **)t10);
    memcpy(t13, t6, 12U);
    xsi_driver_first_trans_fast(t5);
    goto LAB10;

}

static void work_a_1142784088_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (11 - 11);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6320);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 6096);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1142784088_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (11 - 5);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6384);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 6112);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1142784088_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 6128);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t5 = t1;
    memset(t5, (unsigned char)2, 6U);
    t6 = (t0 + 6448);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 992U);
    t11 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t11 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(71, ng0);
    t5 = (t0 + 2632U);
    t6 = *((char **)t5);
    t5 = (t0 + 6448);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 6U);
    xsi_driver_first_trans_fast(t5);
    goto LAB8;

}

static void work_a_1142784088_3212880686_p_4(char *t0)
{
    char t39[16];
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned char t29;
    char *t30;
    char *t31;
    unsigned char t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;

LAB0:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t3 = (t0 + 2960U);
    t5 = *((char **)t3);
    t6 = ((WORK_P_0606889405) + 1888U);
    t7 = *((char **)t6);
    t6 = ((WORK_P_0606889405) + 1896);
    t6 = *((char **)t6);
    t8 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t5, t7, t6);
    if (t8 == 1)
        goto LAB8;

LAB9:    t10 = (t0 + 2952U);
    t11 = *((char **)t10);
    t10 = (t0 + 2960U);
    t12 = *((char **)t10);
    t13 = ((WORK_P_0606889405) + 2128U);
    t14 = *((char **)t13);
    t13 = ((WORK_P_0606889405) + 2136);
    t13 = *((char **)t13);
    t15 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t11, t12, t14, t13);
    if (t15 == 1)
        goto LAB11;

LAB12:    t9 = (unsigned char)0;

LAB13:    t2 = t9;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 2952U);
    t25 = *((char **)t17);
    t17 = (t0 + 2960U);
    t26 = *((char **)t17);
    t27 = ((WORK_P_0606889405) + 2008U);
    t28 = *((char **)t27);
    t27 = ((WORK_P_0606889405) + 2016);
    t27 = *((char **)t27);
    t29 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t25, t26, t28, t27);
    if (t29 == 1)
        goto LAB17;

LAB18:    t24 = (unsigned char)0;

LAB19:    t1 = t24;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 2472U);
    t4 = *((char **)t3);
    t3 = (t0 + 9104U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t39, t4, t3, 1);
    t6 = (t39 + 12U);
    t40 = *((unsigned int *)t6);
    t41 = (1U * t40);
    t1 = (6U != t41);
    if (t1 == 1)
        goto LAB20;

LAB21:    t7 = (t0 + 6512);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 6U);
    xsi_driver_first_trans_fast(t7);

LAB3:    t3 = (t0 + 6144);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(80, ng0);
    t30 = (t0 + 3112U);
    t34 = *((char **)t30);
    t30 = (t0 + 6512);
    t35 = (t30 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t34, 6U);
    xsi_driver_first_trans_fast(t30);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t17 = (t0 + 1672U);
    t18 = *((char **)t17);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)3);
    if (t20 == 1)
        goto LAB14;

LAB15:    t17 = (t0 + 1832U);
    t21 = *((char **)t17);
    t22 = *((unsigned char *)t21);
    t23 = (t22 == (unsigned char)3);
    t16 = t23;

LAB16:    t9 = t16;
    goto LAB13;

LAB14:    t16 = (unsigned char)1;
    goto LAB16;

LAB17:    t30 = (t0 + 1672U);
    t31 = *((char **)t30);
    t32 = *((unsigned char *)t31);
    t33 = (t32 == (unsigned char)3);
    t24 = t33;
    goto LAB19;

LAB20:    xsi_size_not_matching(6U, t41, 0);
    goto LAB21;

}

static void work_a_1142784088_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(86, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 6576);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 6160);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1142784088_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(87, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 6640);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 6U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 6176);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1142784088_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1142784088_3212880686_p_0,(void *)work_a_1142784088_3212880686_p_1,(void *)work_a_1142784088_3212880686_p_2,(void *)work_a_1142784088_3212880686_p_3,(void *)work_a_1142784088_3212880686_p_4,(void *)work_a_1142784088_3212880686_p_5,(void *)work_a_1142784088_3212880686_p_6};
	xsi_register_didat("work_a_1142784088_3212880686", "isim/TB_ROM_UNIT_isim_beh.exe.sim/work/a_1142784088_3212880686.didat");
	xsi_register_executes(pe);
}
