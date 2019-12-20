//stm32l476xx_ADC_definitions.h wmh 2019-11-02 : ADC definitions extracted from stm32l476xx.h
//  - we use only ADC definitions so as to avoid requiring the tree of #includes of the original stm32L476xx.h 

//definitions lifted from core_cm4.h 
#define		__I     volatile const       /*!< Defines 'read only' permissions */
#define		__O     volatile        	/*!< Defines 'write only' permissions */
#define		__IO    volatile          	/*!< Defines 'read / write' permissions */



typedef struct
{
  __IO uint32_t CR1;         /*!< TIM control register 1,                   Address offset: 0x00 */
  __IO uint32_t CR2;         /*!< TIM control register 2,                   Address offset: 0x04 */
  __IO uint32_t SMCR;        /*!< TIM slave mode control register,          Address offset: 0x08 */
  __IO uint32_t DIER;        /*!< TIM DMA/interrupt enable register,        Address offset: 0x0C */
  __IO uint32_t SR;          /*!< TIM status register,                      Address offset: 0x10 */
  __IO uint32_t EGR;         /*!< TIM event generation register,            Address offset: 0x14 */
  __IO uint32_t CCMR1;       /*!< TIM capture/compare mode register 1,      Address offset: 0x18 */
  __IO uint32_t CCMR2;       /*!< TIM capture/compare mode register 2,      Address offset: 0x1C */
  __IO uint32_t CCER;        /*!< TIM capture/compare enable register,      Address offset: 0x20 */
  __IO uint32_t CNT;         /*!< TIM counter register,                     Address offset: 0x24 */
  __IO uint32_t PSC;         /*!< TIM prescaler,                            Address offset: 0x28 */
  __IO uint32_t ARR;         /*!< TIM auto-reload register,                 Address offset: 0x2C */
  __IO uint32_t RCR;         /*!< TIM repetition counter register,          Address offset: 0x30 */
  __IO uint32_t CCR1;        /*!< TIM capture/compare register 1,           Address offset: 0x34 */
  __IO uint32_t CCR2;        /*!< TIM capture/compare register 2,           Address offset: 0x38 */
  __IO uint32_t CCR3;        /*!< TIM capture/compare register 3,           Address offset: 0x3C */
  __IO uint32_t CCR4;        /*!< TIM capture/compare register 4,           Address offset: 0x40 */
  __IO uint32_t BDTR;        /*!< TIM break and dead-time register,         Address offset: 0x44 */
  __IO uint32_t DCR;         /*!< TIM DMA control register,                 Address offset: 0x48 */
  __IO uint32_t DMAR;        /*!< TIM DMA address for full transfer,        Address offset: 0x4C */
  __IO uint32_t OR1;         /*!< TIM option register 1,                    Address offset: 0x50 */
  __IO uint32_t CCMR3;       /*!< TIM capture/compare mode register 3,      Address offset: 0x54 */
  __IO uint32_t CCR5;        /*!< TIM capture/compare register5,            Address offset: 0x58 */
  __IO uint32_t CCR6;        /*!< TIM capture/compare register6,            Address offset: 0x5C */
  __IO uint32_t OR2;         /*!< TIM option register 2,                    Address offset: 0x60 */
  __IO uint32_t OR3;         /*!< TIM option register 3,                    Address offset: 0x64 */
} TIM_TypeDef;





 #define ADC1_2_IRQn	18	/*!< ADC1, ADC2 SAR global Interrupts                                  */
 #define ADC3_IRQn		47	/*!< ADC3 global  Interrupt                                            */

typedef struct
{
  __IO uint32_t ISR;          /*!< ADC interrupt and status register,             Address offset: 0x00 */
  __IO uint32_t IER;          /*!< ADC interrupt enable register,                 Address offset: 0x04 */
  __IO uint32_t CR;           /*!< ADC control register,                          Address offset: 0x08 */
  __IO uint32_t CFGR;         /*!< ADC configuration register 1,                  Address offset: 0x0C */
  __IO uint32_t CFGR2;        /*!< ADC configuration register 2,                  Address offset: 0x10 */
  __IO uint32_t SMPR1;        /*!< ADC sampling time register 1,                  Address offset: 0x14 */
  __IO uint32_t SMPR2;        /*!< ADC sampling time register 2,                  Address offset: 0x18 */
       uint32_t RESERVED1;    /*!< Reserved,                                                      0x1C */
  __IO uint32_t TR1;          /*!< ADC analog watchdog 1 threshold register,      Address offset: 0x20 */
  __IO uint32_t TR2;          /*!< ADC analog watchdog 2 threshold register,      Address offset: 0x24 */
  __IO uint32_t TR3;          /*!< ADC analog watchdog 3 threshold register,      Address offset: 0x28 */
       uint32_t RESERVED2;    /*!< Reserved,                                                      0x2C */
  __IO uint32_t SQR1;         /*!< ADC group regular sequencer register 1,        Address offset: 0x30 */
  __IO uint32_t SQR2;         /*!< ADC group regular sequencer register 2,        Address offset: 0x34 */
  __IO uint32_t SQR3;         /*!< ADC group regular sequencer register 3,        Address offset: 0x38 */
  __IO uint32_t SQR4;         /*!< ADC group regular sequencer register 4,        Address offset: 0x3C */
  __IO uint32_t DR;           /*!< ADC group regular data register,               Address offset: 0x40 */
       uint32_t RESERVED3;    /*!< Reserved,                                                      0x44 */
       uint32_t RESERVED4;    /*!< Reserved,                                                      0x48 */
  __IO uint32_t JSQR;         /*!< ADC group injected sequencer register,         Address offset: 0x4C */
       uint32_t RESERVED5[4]; /*!< Reserved,                                               0x50 - 0x5C */
  __IO uint32_t OFR1;         /*!< ADC offset register 1,                         Address offset: 0x60 */
  __IO uint32_t OFR2;         /*!< ADC offset register 2,                         Address offset: 0x64 */
  __IO uint32_t OFR3;         /*!< ADC offset register 3,                         Address offset: 0x68 */
  __IO uint32_t OFR4;         /*!< ADC offset register 4,                         Address offset: 0x6C */
       uint32_t RESERVED6[4]; /*!< Reserved,                                               0x70 - 0x7C */
  __IO uint32_t JDR1;         /*!< ADC group injected rank 1 data register,       Address offset: 0x80 */
  __IO uint32_t JDR2;         /*!< ADC group injected rank 2 data register,       Address offset: 0x84 */
  __IO uint32_t JDR3;         /*!< ADC group injected rank 3 data register,       Address offset: 0x88 */
  __IO uint32_t JDR4;         /*!< ADC group injected rank 4 data register,       Address offset: 0x8C */
       uint32_t RESERVED7[4]; /*!< Reserved,                                             0x090 - 0x09C */
  __IO uint32_t AWD2CR;       /*!< ADC analog watchdog 1 configuration register,  Address offset: 0xA0 */
  __IO uint32_t AWD3CR;       /*!< ADC analog watchdog 3 Configuration Register,  Address offset: 0xA4 */
       uint32_t RESERVED8;    /*!< Reserved,                                                     0x0A8 */
       uint32_t RESERVED9;    /*!< Reserved,                                                     0x0AC */
  __IO uint32_t DIFSEL;       /*!< ADC differential mode selection register,      Address offset: 0xB0 */
  __IO uint32_t CALFACT;      /*!< ADC calibration factors,                       Address offset: 0xB4 */

} ADC_TypeDef;

typedef struct
{
  __IO uint32_t CSR;          /*!< ADC common status register,                    Address offset: ADC1 base address + 0x300 */
  uint32_t      RESERVED;     /*!< Reserved,                                      Address offset: ADC1 base address + 0x304 */
  __IO uint32_t CCR;          /*!< ADC common configuration register,             Address offset: ADC1 base address + 0x308 */
  __IO uint32_t CDR;          /*!< ADC common group regular data register         Address offset: ADC1 base address + 0x30C */
} ADC_Common_TypeDef;

/******************************************************************************/
/*                         Peripheral Registers_Bits_Definition               */
/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/*                        Analog to Digital Converter                         */
/*                                                                            */
/******************************************************************************/

/*
 * @brief Specific device feature definitions (not present on all devices in the STM32L4 serie)
 */
#define ADC_MULTIMODE_SUPPORT                          /*!< ADC feature available only on specific devices: multimode available on devices with several ADC instances */

/********************  Bit definition for ADC_ISR register  *******************/
#define ADC_ISR_ADRDY_Pos              (0U)                                    
#define ADC_ISR_ADRDY_Msk              (0x1U << ADC_ISR_ADRDY_Pos)             /*!< 0x00000001 */
#define ADC_ISR_ADRDY                  ADC_ISR_ADRDY_Msk                       /*!< ADC ready flag */
#define ADC_ISR_EOSMP_Pos              (1U)                                    
#define ADC_ISR_EOSMP_Msk              (0x1U << ADC_ISR_EOSMP_Pos)             /*!< 0x00000002 */
#define ADC_ISR_EOSMP                  ADC_ISR_EOSMP_Msk                       /*!< ADC group regular end of sampling flag */
#define ADC_ISR_EOC_Pos                (2U)                                    
#define ADC_ISR_EOC_Msk                (0x1U << ADC_ISR_EOC_Pos)               /*!< 0x00000004 */
#define ADC_ISR_EOC                    ADC_ISR_EOC_Msk                         /*!< ADC group regular end of unitary conversion flag */
#define ADC_ISR_EOS_Pos                (3U)                                    
#define ADC_ISR_EOS_Msk                (0x1U << ADC_ISR_EOS_Pos)               /*!< 0x00000008 */
#define ADC_ISR_EOS                    ADC_ISR_EOS_Msk                         /*!< ADC group regular end of sequence conversions flag */
#define ADC_ISR_OVR_Pos                (4U)                                    
#define ADC_ISR_OVR_Msk                (0x1U << ADC_ISR_OVR_Pos)               /*!< 0x00000010 */
#define ADC_ISR_OVR                    ADC_ISR_OVR_Msk                         /*!< ADC group regular overrun flag */
#define ADC_ISR_JEOC_Pos               (5U)                                    
#define ADC_ISR_JEOC_Msk               (0x1U << ADC_ISR_JEOC_Pos)              /*!< 0x00000020 */
#define ADC_ISR_JEOC                   ADC_ISR_JEOC_Msk                        /*!< ADC group injected end of unitary conversion flag */
#define ADC_ISR_JEOS_Pos               (6U)                                    
#define ADC_ISR_JEOS_Msk               (0x1U << ADC_ISR_JEOS_Pos)              /*!< 0x00000040 */
#define ADC_ISR_JEOS                   ADC_ISR_JEOS_Msk                        /*!< ADC group injected end of sequence conversions flag */
#define ADC_ISR_AWD1_Pos               (7U)                                    
#define ADC_ISR_AWD1_Msk               (0x1U << ADC_ISR_AWD1_Pos)              /*!< 0x00000080 */
#define ADC_ISR_AWD1                   ADC_ISR_AWD1_Msk                        /*!< ADC analog watchdog 1 flag */
#define ADC_ISR_AWD2_Pos               (8U)                                    
#define ADC_ISR_AWD2_Msk               (0x1U << ADC_ISR_AWD2_Pos)              /*!< 0x00000100 */
#define ADC_ISR_AWD2                   ADC_ISR_AWD2_Msk                        /*!< ADC analog watchdog 2 flag */
#define ADC_ISR_AWD3_Pos               (9U)                                    
#define ADC_ISR_AWD3_Msk               (0x1U << ADC_ISR_AWD3_Pos)              /*!< 0x00000200 */
#define ADC_ISR_AWD3                   ADC_ISR_AWD3_Msk                        /*!< ADC analog watchdog 3 flag */
#define ADC_ISR_JQOVF_Pos              (10U)                                   
#define ADC_ISR_JQOVF_Msk              (0x1U << ADC_ISR_JQOVF_Pos)             /*!< 0x00000400 */
#define ADC_ISR_JQOVF                  ADC_ISR_JQOVF_Msk                       /*!< ADC group injected contexts queue overflow flag */

/********************  Bit definition for ADC_IER register  *******************/
#define ADC_IER_ADRDYIE_Pos            (0U)                                    
#define ADC_IER_ADRDYIE_Msk            (0x1U << ADC_IER_ADRDYIE_Pos)           /*!< 0x00000001 */
#define ADC_IER_ADRDYIE                ADC_IER_ADRDYIE_Msk                     /*!< ADC ready interrupt */
#define ADC_IER_EOSMPIE_Pos            (1U)                                    
#define ADC_IER_EOSMPIE_Msk            (0x1U << ADC_IER_EOSMPIE_Pos)           /*!< 0x00000002 */
#define ADC_IER_EOSMPIE                ADC_IER_EOSMPIE_Msk                     /*!< ADC group regular end of sampling interrupt */
#define ADC_IER_EOCIE_Pos              (2U)                                    
#define ADC_IER_EOCIE_Msk              (0x1U << ADC_IER_EOCIE_Pos)             /*!< 0x00000004 */
#define ADC_IER_EOCIE                  ADC_IER_EOCIE_Msk                       /*!< ADC group regular end of unitary conversion interrupt */
#define ADC_IER_EOSIE_Pos              (3U)                                    
#define ADC_IER_EOSIE_Msk              (0x1U << ADC_IER_EOSIE_Pos)             /*!< 0x00000008 */
#define ADC_IER_EOSIE                  ADC_IER_EOSIE_Msk                       /*!< ADC group regular end of sequence conversions interrupt */
#define ADC_IER_OVRIE_Pos              (4U)                                    
#define ADC_IER_OVRIE_Msk              (0x1U << ADC_IER_OVRIE_Pos)             /*!< 0x00000010 */
#define ADC_IER_OVRIE                  ADC_IER_OVRIE_Msk                       /*!< ADC group regular overrun interrupt */
#define ADC_IER_JEOCIE_Pos             (5U)                                    
#define ADC_IER_JEOCIE_Msk             (0x1U << ADC_IER_JEOCIE_Pos)            /*!< 0x00000020 */
#define ADC_IER_JEOCIE                 ADC_IER_JEOCIE_Msk                      /*!< ADC group injected end of unitary conversion interrupt */
#define ADC_IER_JEOSIE_Pos             (6U)                                    
#define ADC_IER_JEOSIE_Msk             (0x1U << ADC_IER_JEOSIE_Pos)            /*!< 0x00000040 */
#define ADC_IER_JEOSIE                 ADC_IER_JEOSIE_Msk                      /*!< ADC group injected end of sequence conversions interrupt */
#define ADC_IER_AWD1IE_Pos             (7U)                                    
#define ADC_IER_AWD1IE_Msk             (0x1U << ADC_IER_AWD1IE_Pos)            /*!< 0x00000080 */
#define ADC_IER_AWD1IE                 ADC_IER_AWD1IE_Msk                      /*!< ADC analog watchdog 1 interrupt */
#define ADC_IER_AWD2IE_Pos             (8U)                                    
#define ADC_IER_AWD2IE_Msk             (0x1U << ADC_IER_AWD2IE_Pos)            /*!< 0x00000100 */
#define ADC_IER_AWD2IE                 ADC_IER_AWD2IE_Msk                      /*!< ADC analog watchdog 2 interrupt */
#define ADC_IER_AWD3IE_Pos             (9U)                                    
#define ADC_IER_AWD3IE_Msk             (0x1U << ADC_IER_AWD3IE_Pos)            /*!< 0x00000200 */
#define ADC_IER_AWD3IE                 ADC_IER_AWD3IE_Msk                      /*!< ADC analog watchdog 3 interrupt */
#define ADC_IER_JQOVFIE_Pos            (10U)                                   
#define ADC_IER_JQOVFIE_Msk            (0x1U << ADC_IER_JQOVFIE_Pos)           /*!< 0x00000400 */
#define ADC_IER_JQOVFIE                ADC_IER_JQOVFIE_Msk                     /*!< ADC group injected contexts queue overflow interrupt */

/* Legacy defines */
#define ADC_IER_ADRDY           (ADC_IER_ADRDYIE)
#define ADC_IER_EOSMP           (ADC_IER_EOSMPIE)
#define ADC_IER_EOC             (ADC_IER_EOCIE)
#define ADC_IER_EOS             (ADC_IER_EOSIE)
#define ADC_IER_OVR             (ADC_IER_OVRIE)
#define ADC_IER_JEOC            (ADC_IER_JEOCIE)
#define ADC_IER_JEOS            (ADC_IER_JEOSIE)
#define ADC_IER_AWD1            (ADC_IER_AWD1IE)
#define ADC_IER_AWD2            (ADC_IER_AWD2IE)
#define ADC_IER_AWD3            (ADC_IER_AWD3IE)
#define ADC_IER_JQOVF           (ADC_IER_JQOVFIE)

/********************  Bit definition for ADC_CR register  ********************/
#define ADC_CR_ADEN_Pos                (0U)                                    
#define ADC_CR_ADEN_Msk                (0x1U << ADC_CR_ADEN_Pos)               /*!< 0x00000001 */
#define ADC_CR_ADEN                    ADC_CR_ADEN_Msk                         /*!< ADC enable */
#define ADC_CR_ADDIS_Pos               (1U)                                    
#define ADC_CR_ADDIS_Msk               (0x1U << ADC_CR_ADDIS_Pos)              /*!< 0x00000002 */
#define ADC_CR_ADDIS                   ADC_CR_ADDIS_Msk                        /*!< ADC disable */
#define ADC_CR_ADSTART_Pos             (2U)                                    
#define ADC_CR_ADSTART_Msk             (0x1U << ADC_CR_ADSTART_Pos)            /*!< 0x00000004 */
#define ADC_CR_ADSTART                 ADC_CR_ADSTART_Msk                      /*!< ADC group regular conversion start */
#define ADC_CR_JADSTART_Pos            (3U)                                    
#define ADC_CR_JADSTART_Msk            (0x1U << ADC_CR_JADSTART_Pos)           /*!< 0x00000008 */
#define ADC_CR_JADSTART                ADC_CR_JADSTART_Msk                     /*!< ADC group injected conversion start */
#define ADC_CR_ADSTP_Pos               (4U)                                    
#define ADC_CR_ADSTP_Msk               (0x1U << ADC_CR_ADSTP_Pos)              /*!< 0x00000010 */
#define ADC_CR_ADSTP                   ADC_CR_ADSTP_Msk                        /*!< ADC group regular conversion stop */
#define ADC_CR_JADSTP_Pos              (5U)                                    
#define ADC_CR_JADSTP_Msk              (0x1U << ADC_CR_JADSTP_Pos)             /*!< 0x00000020 */
#define ADC_CR_JADSTP                  ADC_CR_JADSTP_Msk                       /*!< ADC group injected conversion stop */
#define ADC_CR_ADVREGEN_Pos            (28U)                                   
#define ADC_CR_ADVREGEN_Msk            (0x1U << ADC_CR_ADVREGEN_Pos)           /*!< 0x10000000 */
#define ADC_CR_ADVREGEN                ADC_CR_ADVREGEN_Msk                     /*!< ADC voltage regulator enable */
#define ADC_CR_DEEPPWD_Pos             (29U)                                   
#define ADC_CR_DEEPPWD_Msk             (0x1U << ADC_CR_DEEPPWD_Pos)            /*!< 0x20000000 */
#define ADC_CR_DEEPPWD                 ADC_CR_DEEPPWD_Msk                      /*!< ADC deep power down enable */
#define ADC_CR_ADCALDIF_Pos            (30U)                                   
#define ADC_CR_ADCALDIF_Msk            (0x1U << ADC_CR_ADCALDIF_Pos)           /*!< 0x40000000 */
#define ADC_CR_ADCALDIF                ADC_CR_ADCALDIF_Msk                     /*!< ADC differential mode for calibration */
#define ADC_CR_ADCAL_Pos               (31U)                                   
#define ADC_CR_ADCAL_Msk               (0x1U << ADC_CR_ADCAL_Pos)              /*!< 0x80000000 */
#define ADC_CR_ADCAL                   ADC_CR_ADCAL_Msk                        /*!< ADC calibration */

/********************  Bit definition for ADC_CFGR register  ******************/
#define ADC_CFGR_DMAEN_Pos             (0U)                                    
#define ADC_CFGR_DMAEN_Msk             (0x1U << ADC_CFGR_DMAEN_Pos)            /*!< 0x00000001 */
#define ADC_CFGR_DMAEN                 ADC_CFGR_DMAEN_Msk                      /*!< ADC DMA transfer enable */
#define ADC_CFGR_DMACFG_Pos            (1U)                                    
#define ADC_CFGR_DMACFG_Msk            (0x1U << ADC_CFGR_DMACFG_Pos)           /*!< 0x00000002 */
#define ADC_CFGR_DMACFG                ADC_CFGR_DMACFG_Msk                     /*!< ADC DMA transfer configuration */

#define ADC_CFGR_RES_Pos               (3U)                                    
#define ADC_CFGR_RES_Msk               (0x3U << ADC_CFGR_RES_Pos)              /*!< 0x00000018 */
#define ADC_CFGR_RES                   ADC_CFGR_RES_Msk                        /*!< ADC data resolution */
#define ADC_CFGR_RES_0                 (0x1U << ADC_CFGR_RES_Pos)              /*!< 0x00000008 */
#define ADC_CFGR_RES_1                 (0x2U << ADC_CFGR_RES_Pos)              /*!< 0x00000010 */

#define ADC_CFGR_ALIGN_Pos             (5U)                                    
#define ADC_CFGR_ALIGN_Msk             (0x1U << ADC_CFGR_ALIGN_Pos)            /*!< 0x00000020 */
#define ADC_CFGR_ALIGN                 ADC_CFGR_ALIGN_Msk                      /*!< ADC data alignement */

#define ADC_CFGR_EXTSEL_Pos            (6U)                                    
#define ADC_CFGR_EXTSEL_Msk            (0xFU << ADC_CFGR_EXTSEL_Pos)           /*!< 0x000003C0 */
#define ADC_CFGR_EXTSEL                ADC_CFGR_EXTSEL_Msk                     /*!< ADC group regular external trigger source */
#define ADC_CFGR_EXTSEL_0              (0x1U << ADC_CFGR_EXTSEL_Pos)           /*!< 0x00000040 */
#define ADC_CFGR_EXTSEL_1              (0x2U << ADC_CFGR_EXTSEL_Pos)           /*!< 0x00000080 */
#define ADC_CFGR_EXTSEL_2              (0x4U << ADC_CFGR_EXTSEL_Pos)           /*!< 0x00000100 */
#define ADC_CFGR_EXTSEL_3              (0x8U << ADC_CFGR_EXTSEL_Pos)           /*!< 0x00000200 */

#define ADC_CFGR_EXTEN_Pos             (10U)                                   
#define ADC_CFGR_EXTEN_Msk             (0x3U << ADC_CFGR_EXTEN_Pos)            /*!< 0x00000C00 */
#define ADC_CFGR_EXTEN                 ADC_CFGR_EXTEN_Msk                      /*!< ADC group regular external trigger polarity */
#define ADC_CFGR_EXTEN_0               (0x1U << ADC_CFGR_EXTEN_Pos)            /*!< 0x00000400 */
#define ADC_CFGR_EXTEN_1               (0x2U << ADC_CFGR_EXTEN_Pos)            /*!< 0x00000800 */

#define ADC_CFGR_OVRMOD_Pos            (12U)                                   
#define ADC_CFGR_OVRMOD_Msk            (0x1U << ADC_CFGR_OVRMOD_Pos)           /*!< 0x00001000 */
#define ADC_CFGR_OVRMOD                ADC_CFGR_OVRMOD_Msk                     /*!< ADC group regular overrun configuration */
#define ADC_CFGR_CONT_Pos              (13U)                                   
#define ADC_CFGR_CONT_Msk              (0x1U << ADC_CFGR_CONT_Pos)             /*!< 0x00002000 */
#define ADC_CFGR_CONT                  ADC_CFGR_CONT_Msk                       /*!< ADC group regular continuous conversion mode */
#define ADC_CFGR_AUTDLY_Pos            (14U)                                   
#define ADC_CFGR_AUTDLY_Msk            (0x1U << ADC_CFGR_AUTDLY_Pos)           /*!< 0x00004000 */
#define ADC_CFGR_AUTDLY                ADC_CFGR_AUTDLY_Msk                     /*!< ADC low power auto wait */

#define ADC_CFGR_DISCEN_Pos            (16U)                                   
#define ADC_CFGR_DISCEN_Msk            (0x1U << ADC_CFGR_DISCEN_Pos)           /*!< 0x00010000 */
#define ADC_CFGR_DISCEN                ADC_CFGR_DISCEN_Msk                     /*!< ADC group regular sequencer discontinuous mode */

#define ADC_CFGR_DISCNUM_Pos           (17U)                                   
#define ADC_CFGR_DISCNUM_Msk           (0x7U << ADC_CFGR_DISCNUM_Pos)          /*!< 0x000E0000 */
#define ADC_CFGR_DISCNUM               ADC_CFGR_DISCNUM_Msk                    /*!< ADC group regular sequencer discontinuous number of ranks */
#define ADC_CFGR_DISCNUM_0             (0x1U << ADC_CFGR_DISCNUM_Pos)          /*!< 0x00020000 */
#define ADC_CFGR_DISCNUM_1             (0x2U << ADC_CFGR_DISCNUM_Pos)          /*!< 0x00040000 */
#define ADC_CFGR_DISCNUM_2             (0x4U << ADC_CFGR_DISCNUM_Pos)          /*!< 0x00080000 */

#define ADC_CFGR_JDISCEN_Pos           (20U)                                   
#define ADC_CFGR_JDISCEN_Msk           (0x1U << ADC_CFGR_JDISCEN_Pos)          /*!< 0x00100000 */
#define ADC_CFGR_JDISCEN               ADC_CFGR_JDISCEN_Msk                    /*!< ADC group injected sequencer discontinuous mode */
#define ADC_CFGR_JQM_Pos               (21U)                                   
#define ADC_CFGR_JQM_Msk               (0x1U << ADC_CFGR_JQM_Pos)              /*!< 0x00200000 */
#define ADC_CFGR_JQM                   ADC_CFGR_JQM_Msk                        /*!< ADC group injected contexts queue mode */
#define ADC_CFGR_AWD1SGL_Pos           (22U)                                   
#define ADC_CFGR_AWD1SGL_Msk           (0x1U << ADC_CFGR_AWD1SGL_Pos)          /*!< 0x00400000 */
#define ADC_CFGR_AWD1SGL               ADC_CFGR_AWD1SGL_Msk                    /*!< ADC analog watchdog 1 monitoring a single channel or all channels */
#define ADC_CFGR_AWD1EN_Pos            (23U)                                   
#define ADC_CFGR_AWD1EN_Msk            (0x1U << ADC_CFGR_AWD1EN_Pos)           /*!< 0x00800000 */
#define ADC_CFGR_AWD1EN                ADC_CFGR_AWD1EN_Msk                     /*!< ADC analog watchdog 1 enable on scope ADC group regular */
#define ADC_CFGR_JAWD1EN_Pos           (24U)                                   
#define ADC_CFGR_JAWD1EN_Msk           (0x1U << ADC_CFGR_JAWD1EN_Pos)          /*!< 0x01000000 */
#define ADC_CFGR_JAWD1EN               ADC_CFGR_JAWD1EN_Msk                    /*!< ADC analog watchdog 1 enable on scope ADC group injected */
#define ADC_CFGR_JAUTO_Pos             (25U)                                   
#define ADC_CFGR_JAUTO_Msk             (0x1U << ADC_CFGR_JAUTO_Pos)            /*!< 0x02000000 */
#define ADC_CFGR_JAUTO                 ADC_CFGR_JAUTO_Msk                      /*!< ADC group injected automatic trigger mode */

#define ADC_CFGR_AWD1CH_Pos            (26U)                                   
#define ADC_CFGR_AWD1CH_Msk            (0x1FU << ADC_CFGR_AWD1CH_Pos)          /*!< 0x7C000000 */
#define ADC_CFGR_AWD1CH                ADC_CFGR_AWD1CH_Msk                     /*!< ADC analog watchdog 1 monitored channel selection */
#define ADC_CFGR_AWD1CH_0              (0x01U << ADC_CFGR_AWD1CH_Pos)          /*!< 0x04000000 */
#define ADC_CFGR_AWD1CH_1              (0x02U << ADC_CFGR_AWD1CH_Pos)          /*!< 0x08000000 */
#define ADC_CFGR_AWD1CH_2              (0x04U << ADC_CFGR_AWD1CH_Pos)          /*!< 0x10000000 */
#define ADC_CFGR_AWD1CH_3              (0x08U << ADC_CFGR_AWD1CH_Pos)          /*!< 0x20000000 */
#define ADC_CFGR_AWD1CH_4              (0x10U << ADC_CFGR_AWD1CH_Pos)          /*!< 0x40000000 */

#define ADC_CFGR_JQDIS_Pos             (31U)                                   
#define ADC_CFGR_JQDIS_Msk             (0x1U << ADC_CFGR_JQDIS_Pos)            /*!< 0x80000000 */
#define ADC_CFGR_JQDIS                 ADC_CFGR_JQDIS_Msk                      /*!< ADC group injected contexts queue disable */

/********************  Bit definition for ADC_CFGR2 register  *****************/
#define ADC_CFGR2_ROVSE_Pos            (0U)                                    
#define ADC_CFGR2_ROVSE_Msk            (0x1U << ADC_CFGR2_ROVSE_Pos)           /*!< 0x00000001 */
#define ADC_CFGR2_ROVSE                ADC_CFGR2_ROVSE_Msk                     /*!< ADC oversampler enable on scope ADC group regular */
#define ADC_CFGR2_JOVSE_Pos            (1U)                                    
#define ADC_CFGR2_JOVSE_Msk            (0x1U << ADC_CFGR2_JOVSE_Pos)           /*!< 0x00000002 */
#define ADC_CFGR2_JOVSE                ADC_CFGR2_JOVSE_Msk                     /*!< ADC oversampler enable on scope ADC group injected */

#define ADC_CFGR2_OVSR_Pos             (2U)                                    
#define ADC_CFGR2_OVSR_Msk             (0x7U << ADC_CFGR2_OVSR_Pos)            /*!< 0x0000001C */
#define ADC_CFGR2_OVSR                 ADC_CFGR2_OVSR_Msk                      /*!< ADC oversampling ratio */
#define ADC_CFGR2_OVSR_0               (0x1U << ADC_CFGR2_OVSR_Pos)            /*!< 0x00000004 */
#define ADC_CFGR2_OVSR_1               (0x2U << ADC_CFGR2_OVSR_Pos)            /*!< 0x00000008 */
#define ADC_CFGR2_OVSR_2               (0x4U << ADC_CFGR2_OVSR_Pos)            /*!< 0x00000010 */

#define ADC_CFGR2_OVSS_Pos             (5U)                                    
#define ADC_CFGR2_OVSS_Msk             (0xFU << ADC_CFGR2_OVSS_Pos)            /*!< 0x000001E0 */
#define ADC_CFGR2_OVSS                 ADC_CFGR2_OVSS_Msk                      /*!< ADC oversampling shift */
#define ADC_CFGR2_OVSS_0               (0x1U << ADC_CFGR2_OVSS_Pos)            /*!< 0x00000020 */
#define ADC_CFGR2_OVSS_1               (0x2U << ADC_CFGR2_OVSS_Pos)            /*!< 0x00000040 */
#define ADC_CFGR2_OVSS_2               (0x4U << ADC_CFGR2_OVSS_Pos)            /*!< 0x00000080 */
#define ADC_CFGR2_OVSS_3               (0x8U << ADC_CFGR2_OVSS_Pos)            /*!< 0x00000100 */

#define ADC_CFGR2_TROVS_Pos            (9U)                                    
#define ADC_CFGR2_TROVS_Msk            (0x1U << ADC_CFGR2_TROVS_Pos)           /*!< 0x00000200 */
#define ADC_CFGR2_TROVS                ADC_CFGR2_TROVS_Msk                     /*!< ADC oversampling discontinuous mode (triggered mode) for ADC group regular */
#define ADC_CFGR2_ROVSM_Pos            (10U)                                   
#define ADC_CFGR2_ROVSM_Msk            (0x1U << ADC_CFGR2_ROVSM_Pos)           /*!< 0x00000400 */
#define ADC_CFGR2_ROVSM                ADC_CFGR2_ROVSM_Msk                     /*!< ADC oversampling mode managing interlaced conversions of ADC group regular and group injected */

/********************  Bit definition for ADC_SMPR1 register  *****************/
#define ADC_SMPR1_SMP0_Pos             (0U)                                    
#define ADC_SMPR1_SMP0_Msk             (0x7U << ADC_SMPR1_SMP0_Pos)            /*!< 0x00000007 */
#define ADC_SMPR1_SMP0                 ADC_SMPR1_SMP0_Msk                      /*!< ADC channel 0 sampling time selection  */
#define ADC_SMPR1_SMP0_0               (0x1U << ADC_SMPR1_SMP0_Pos)            /*!< 0x00000001 */
#define ADC_SMPR1_SMP0_1               (0x2U << ADC_SMPR1_SMP0_Pos)            /*!< 0x00000002 */
#define ADC_SMPR1_SMP0_2               (0x4U << ADC_SMPR1_SMP0_Pos)            /*!< 0x00000004 */

#define ADC_SMPR1_SMP1_Pos             (3U)                                    
#define ADC_SMPR1_SMP1_Msk             (0x7U << ADC_SMPR1_SMP1_Pos)            /*!< 0x00000038 */
#define ADC_SMPR1_SMP1                 ADC_SMPR1_SMP1_Msk                      /*!< ADC channel 1 sampling time selection  */
#define ADC_SMPR1_SMP1_0               (0x1U << ADC_SMPR1_SMP1_Pos)            /*!< 0x00000008 */
#define ADC_SMPR1_SMP1_1               (0x2U << ADC_SMPR1_SMP1_Pos)            /*!< 0x00000010 */
#define ADC_SMPR1_SMP1_2               (0x4U << ADC_SMPR1_SMP1_Pos)            /*!< 0x00000020 */

#define ADC_SMPR1_SMP2_Pos             (6U)                                    
#define ADC_SMPR1_SMP2_Msk             (0x7U << ADC_SMPR1_SMP2_Pos)            /*!< 0x000001C0 */
#define ADC_SMPR1_SMP2                 ADC_SMPR1_SMP2_Msk                      /*!< ADC channel 2 sampling time selection  */
#define ADC_SMPR1_SMP2_0               (0x1U << ADC_SMPR1_SMP2_Pos)            /*!< 0x00000040 */
#define ADC_SMPR1_SMP2_1               (0x2U << ADC_SMPR1_SMP2_Pos)            /*!< 0x00000080 */
#define ADC_SMPR1_SMP2_2               (0x4U << ADC_SMPR1_SMP2_Pos)            /*!< 0x00000100 */

#define ADC_SMPR1_SMP3_Pos             (9U)                                    
#define ADC_SMPR1_SMP3_Msk             (0x7U << ADC_SMPR1_SMP3_Pos)            /*!< 0x00000E00 */
#define ADC_SMPR1_SMP3                 ADC_SMPR1_SMP3_Msk                      /*!< ADC channel 3 sampling time selection  */
#define ADC_SMPR1_SMP3_0               (0x1U << ADC_SMPR1_SMP3_Pos)            /*!< 0x00000200 */
#define ADC_SMPR1_SMP3_1               (0x2U << ADC_SMPR1_SMP3_Pos)            /*!< 0x00000400 */
#define ADC_SMPR1_SMP3_2               (0x4U << ADC_SMPR1_SMP3_Pos)            /*!< 0x00000800 */

#define ADC_SMPR1_SMP4_Pos             (12U)                                   
#define ADC_SMPR1_SMP4_Msk             (0x7U << ADC_SMPR1_SMP4_Pos)            /*!< 0x00007000 */
#define ADC_SMPR1_SMP4                 ADC_SMPR1_SMP4_Msk                      /*!< ADC channel 4 sampling time selection  */
#define ADC_SMPR1_SMP4_0               (0x1U << ADC_SMPR1_SMP4_Pos)            /*!< 0x00001000 */
#define ADC_SMPR1_SMP4_1               (0x2U << ADC_SMPR1_SMP4_Pos)            /*!< 0x00002000 */
#define ADC_SMPR1_SMP4_2               (0x4U << ADC_SMPR1_SMP4_Pos)            /*!< 0x00004000 */

#define ADC_SMPR1_SMP5_Pos             (15U)                                   
#define ADC_SMPR1_SMP5_Msk             (0x7U << ADC_SMPR1_SMP5_Pos)            /*!< 0x00038000 */
#define ADC_SMPR1_SMP5                 ADC_SMPR1_SMP5_Msk                      /*!< ADC channel 5 sampling time selection  */
#define ADC_SMPR1_SMP5_0               (0x1U << ADC_SMPR1_SMP5_Pos)            /*!< 0x00008000 */
#define ADC_SMPR1_SMP5_1               (0x2U << ADC_SMPR1_SMP5_Pos)            /*!< 0x00010000 */
#define ADC_SMPR1_SMP5_2               (0x4U << ADC_SMPR1_SMP5_Pos)            /*!< 0x00020000 */

#define ADC_SMPR1_SMP6_Pos             (18U)                                   
#define ADC_SMPR1_SMP6_Msk             (0x7U << ADC_SMPR1_SMP6_Pos)            /*!< 0x001C0000 */
#define ADC_SMPR1_SMP6                 ADC_SMPR1_SMP6_Msk                      /*!< ADC channel 6 sampling time selection  */
#define ADC_SMPR1_SMP6_0               (0x1U << ADC_SMPR1_SMP6_Pos)            /*!< 0x00040000 */
#define ADC_SMPR1_SMP6_1               (0x2U << ADC_SMPR1_SMP6_Pos)            /*!< 0x00080000 */
#define ADC_SMPR1_SMP6_2               (0x4U << ADC_SMPR1_SMP6_Pos)            /*!< 0x00100000 */

#define ADC_SMPR1_SMP7_Pos             (21U)                                   
#define ADC_SMPR1_SMP7_Msk             (0x7U << ADC_SMPR1_SMP7_Pos)            /*!< 0x00E00000 */
#define ADC_SMPR1_SMP7                 ADC_SMPR1_SMP7_Msk                      /*!< ADC channel 7 sampling time selection  */
#define ADC_SMPR1_SMP7_0               (0x1U << ADC_SMPR1_SMP7_Pos)            /*!< 0x00200000 */
#define ADC_SMPR1_SMP7_1               (0x2U << ADC_SMPR1_SMP7_Pos)            /*!< 0x00400000 */
#define ADC_SMPR1_SMP7_2               (0x4U << ADC_SMPR1_SMP7_Pos)            /*!< 0x00800000 */

#define ADC_SMPR1_SMP8_Pos             (24U)                                   
#define ADC_SMPR1_SMP8_Msk             (0x7U << ADC_SMPR1_SMP8_Pos)            /*!< 0x07000000 */
#define ADC_SMPR1_SMP8                 ADC_SMPR1_SMP8_Msk                      /*!< ADC channel 8 sampling time selection  */
#define ADC_SMPR1_SMP8_0               (0x1U << ADC_SMPR1_SMP8_Pos)            /*!< 0x01000000 */
#define ADC_SMPR1_SMP8_1               (0x2U << ADC_SMPR1_SMP8_Pos)            /*!< 0x02000000 */
#define ADC_SMPR1_SMP8_2               (0x4U << ADC_SMPR1_SMP8_Pos)            /*!< 0x04000000 */

#define ADC_SMPR1_SMP9_Pos             (27U)                                   
#define ADC_SMPR1_SMP9_Msk             (0x7U << ADC_SMPR1_SMP9_Pos)            /*!< 0x38000000 */
#define ADC_SMPR1_SMP9                 ADC_SMPR1_SMP9_Msk                      /*!< ADC channel 9 sampling time selection  */
#define ADC_SMPR1_SMP9_0               (0x1U << ADC_SMPR1_SMP9_Pos)            /*!< 0x08000000 */
#define ADC_SMPR1_SMP9_1               (0x2U << ADC_SMPR1_SMP9_Pos)            /*!< 0x10000000 */
#define ADC_SMPR1_SMP9_2               (0x4U << ADC_SMPR1_SMP9_Pos)            /*!< 0x20000000 */

/********************  Bit definition for ADC_SMPR2 register  *****************/
#define ADC_SMPR2_SMP10_Pos            (0U)                                    
#define ADC_SMPR2_SMP10_Msk            (0x7U << ADC_SMPR2_SMP10_Pos)           /*!< 0x00000007 */
#define ADC_SMPR2_SMP10                ADC_SMPR2_SMP10_Msk                     /*!< ADC channel 10 sampling time selection  */
#define ADC_SMPR2_SMP10_0              (0x1U << ADC_SMPR2_SMP10_Pos)           /*!< 0x00000001 */
#define ADC_SMPR2_SMP10_1              (0x2U << ADC_SMPR2_SMP10_Pos)           /*!< 0x00000002 */
#define ADC_SMPR2_SMP10_2              (0x4U << ADC_SMPR2_SMP10_Pos)           /*!< 0x00000004 */

#define ADC_SMPR2_SMP11_Pos            (3U)                                    
#define ADC_SMPR2_SMP11_Msk            (0x7U << ADC_SMPR2_SMP11_Pos)           /*!< 0x00000038 */
#define ADC_SMPR2_SMP11                ADC_SMPR2_SMP11_Msk                     /*!< ADC channel 11 sampling time selection  */
#define ADC_SMPR2_SMP11_0              (0x1U << ADC_SMPR2_SMP11_Pos)           /*!< 0x00000008 */
#define ADC_SMPR2_SMP11_1              (0x2U << ADC_SMPR2_SMP11_Pos)           /*!< 0x00000010 */
#define ADC_SMPR2_SMP11_2              (0x4U << ADC_SMPR2_SMP11_Pos)           /*!< 0x00000020 */

#define ADC_SMPR2_SMP12_Pos            (6U)                                    
#define ADC_SMPR2_SMP12_Msk            (0x7U << ADC_SMPR2_SMP12_Pos)           /*!< 0x000001C0 */
#define ADC_SMPR2_SMP12                ADC_SMPR2_SMP12_Msk                     /*!< ADC channel 12 sampling time selection  */
#define ADC_SMPR2_SMP12_0              (0x1U << ADC_SMPR2_SMP12_Pos)           /*!< 0x00000040 */
#define ADC_SMPR2_SMP12_1              (0x2U << ADC_SMPR2_SMP12_Pos)           /*!< 0x00000080 */
#define ADC_SMPR2_SMP12_2              (0x4U << ADC_SMPR2_SMP12_Pos)           /*!< 0x00000100 */

#define ADC_SMPR2_SMP13_Pos            (9U)                                    
#define ADC_SMPR2_SMP13_Msk            (0x7U << ADC_SMPR2_SMP13_Pos)           /*!< 0x00000E00 */
#define ADC_SMPR2_SMP13                ADC_SMPR2_SMP13_Msk                     /*!< ADC channel 13 sampling time selection  */
#define ADC_SMPR2_SMP13_0              (0x1U << ADC_SMPR2_SMP13_Pos)           /*!< 0x00000200 */
#define ADC_SMPR2_SMP13_1              (0x2U << ADC_SMPR2_SMP13_Pos)           /*!< 0x00000400 */
#define ADC_SMPR2_SMP13_2              (0x4U << ADC_SMPR2_SMP13_Pos)           /*!< 0x00000800 */

#define ADC_SMPR2_SMP14_Pos            (12U)                                   
#define ADC_SMPR2_SMP14_Msk            (0x7U << ADC_SMPR2_SMP14_Pos)           /*!< 0x00007000 */
#define ADC_SMPR2_SMP14                ADC_SMPR2_SMP14_Msk                     /*!< ADC channel 14 sampling time selection  */
#define ADC_SMPR2_SMP14_0              (0x1U << ADC_SMPR2_SMP14_Pos)           /*!< 0x00001000 */
#define ADC_SMPR2_SMP14_1              (0x2U << ADC_SMPR2_SMP14_Pos)           /*!< 0x00002000 */
#define ADC_SMPR2_SMP14_2              (0x4U << ADC_SMPR2_SMP14_Pos)           /*!< 0x00004000 */

#define ADC_SMPR2_SMP15_Pos            (15U)                                   
#define ADC_SMPR2_SMP15_Msk            (0x7U << ADC_SMPR2_SMP15_Pos)           /*!< 0x00038000 */
#define ADC_SMPR2_SMP15                ADC_SMPR2_SMP15_Msk                     /*!< ADC channel 15 sampling time selection  */
#define ADC_SMPR2_SMP15_0              (0x1U << ADC_SMPR2_SMP15_Pos)           /*!< 0x00008000 */
#define ADC_SMPR2_SMP15_1              (0x2U << ADC_SMPR2_SMP15_Pos)           /*!< 0x00010000 */
#define ADC_SMPR2_SMP15_2              (0x4U << ADC_SMPR2_SMP15_Pos)           /*!< 0x00020000 */

#define ADC_SMPR2_SMP16_Pos            (18U)                                   
#define ADC_SMPR2_SMP16_Msk            (0x7U << ADC_SMPR2_SMP16_Pos)           /*!< 0x001C0000 */
#define ADC_SMPR2_SMP16                ADC_SMPR2_SMP16_Msk                     /*!< ADC channel 16 sampling time selection  */
#define ADC_SMPR2_SMP16_0              (0x1U << ADC_SMPR2_SMP16_Pos)           /*!< 0x00040000 */
#define ADC_SMPR2_SMP16_1              (0x2U << ADC_SMPR2_SMP16_Pos)           /*!< 0x00080000 */
#define ADC_SMPR2_SMP16_2              (0x4U << ADC_SMPR2_SMP16_Pos)           /*!< 0x00100000 */

#define ADC_SMPR2_SMP17_Pos            (21U)                                   
#define ADC_SMPR2_SMP17_Msk            (0x7U << ADC_SMPR2_SMP17_Pos)           /*!< 0x00E00000 */
#define ADC_SMPR2_SMP17                ADC_SMPR2_SMP17_Msk                     /*!< ADC channel 17 sampling time selection  */
#define ADC_SMPR2_SMP17_0              (0x1U << ADC_SMPR2_SMP17_Pos)           /*!< 0x00200000 */
#define ADC_SMPR2_SMP17_1              (0x2U << ADC_SMPR2_SMP17_Pos)           /*!< 0x00400000 */
#define ADC_SMPR2_SMP17_2              (0x4U << ADC_SMPR2_SMP17_Pos)           /*!< 0x00800000 */

#define ADC_SMPR2_SMP18_Pos            (24U)                                   
#define ADC_SMPR2_SMP18_Msk            (0x7U << ADC_SMPR2_SMP18_Pos)           /*!< 0x07000000 */
#define ADC_SMPR2_SMP18                ADC_SMPR2_SMP18_Msk                     /*!< ADC channel 18 sampling time selection  */
#define ADC_SMPR2_SMP18_0              (0x1U << ADC_SMPR2_SMP18_Pos)           /*!< 0x01000000 */
#define ADC_SMPR2_SMP18_1              (0x2U << ADC_SMPR2_SMP18_Pos)           /*!< 0x02000000 */
#define ADC_SMPR2_SMP18_2              (0x4U << ADC_SMPR2_SMP18_Pos)           /*!< 0x04000000 */

/********************  Bit definition for ADC_TR1 register  *******************/
#define ADC_TR1_LT1_Pos                (0U)                                    
#define ADC_TR1_LT1_Msk                (0xFFFU << ADC_TR1_LT1_Pos)             /*!< 0x00000FFF */
#define ADC_TR1_LT1                    ADC_TR1_LT1_Msk                         /*!< ADC analog watchdog 1 threshold low */
#define ADC_TR1_LT1_0                  (0x001U << ADC_TR1_LT1_Pos)             /*!< 0x00000001 */
#define ADC_TR1_LT1_1                  (0x002U << ADC_TR1_LT1_Pos)             /*!< 0x00000002 */
#define ADC_TR1_LT1_2                  (0x004U << ADC_TR1_LT1_Pos)             /*!< 0x00000004 */
#define ADC_TR1_LT1_3                  (0x008U << ADC_TR1_LT1_Pos)             /*!< 0x00000008 */
#define ADC_TR1_LT1_4                  (0x010U << ADC_TR1_LT1_Pos)             /*!< 0x00000010 */
#define ADC_TR1_LT1_5                  (0x020U << ADC_TR1_LT1_Pos)             /*!< 0x00000020 */
#define ADC_TR1_LT1_6                  (0x040U << ADC_TR1_LT1_Pos)             /*!< 0x00000040 */
#define ADC_TR1_LT1_7                  (0x080U << ADC_TR1_LT1_Pos)             /*!< 0x00000080 */
#define ADC_TR1_LT1_8                  (0x100U << ADC_TR1_LT1_Pos)             /*!< 0x00000100 */
#define ADC_TR1_LT1_9                  (0x200U << ADC_TR1_LT1_Pos)             /*!< 0x00000200 */
#define ADC_TR1_LT1_10                 (0x400U << ADC_TR1_LT1_Pos)             /*!< 0x00000400 */
#define ADC_TR1_LT1_11                 (0x800U << ADC_TR1_LT1_Pos)             /*!< 0x00000800 */

#define ADC_TR1_HT1_Pos                (16U)                                   
#define ADC_TR1_HT1_Msk                (0xFFFU << ADC_TR1_HT1_Pos)             /*!< 0x0FFF0000 */
#define ADC_TR1_HT1                    ADC_TR1_HT1_Msk                         /*!< ADC Analog watchdog 1 threshold high */
#define ADC_TR1_HT1_0                  (0x001U << ADC_TR1_HT1_Pos)             /*!< 0x00010000 */
#define ADC_TR1_HT1_1                  (0x002U << ADC_TR1_HT1_Pos)             /*!< 0x00020000 */
#define ADC_TR1_HT1_2                  (0x004U << ADC_TR1_HT1_Pos)             /*!< 0x00040000 */
#define ADC_TR1_HT1_3                  (0x008U << ADC_TR1_HT1_Pos)             /*!< 0x00080000 */
#define ADC_TR1_HT1_4                  (0x010U << ADC_TR1_HT1_Pos)             /*!< 0x00100000 */
#define ADC_TR1_HT1_5                  (0x020U << ADC_TR1_HT1_Pos)             /*!< 0x00200000 */
#define ADC_TR1_HT1_6                  (0x040U << ADC_TR1_HT1_Pos)             /*!< 0x00400000 */
#define ADC_TR1_HT1_7                  (0x080U << ADC_TR1_HT1_Pos)             /*!< 0x00800000 */
#define ADC_TR1_HT1_8                  (0x100U << ADC_TR1_HT1_Pos)             /*!< 0x01000000 */
#define ADC_TR1_HT1_9                  (0x200U << ADC_TR1_HT1_Pos)             /*!< 0x02000000 */
#define ADC_TR1_HT1_10                 (0x400U << ADC_TR1_HT1_Pos)             /*!< 0x04000000 */
#define ADC_TR1_HT1_11                 (0x800U << ADC_TR1_HT1_Pos)             /*!< 0x08000000 */

/********************  Bit definition for ADC_TR2 register  *******************/
#define ADC_TR2_LT2_Pos                (0U)                                    
#define ADC_TR2_LT2_Msk                (0xFFU << ADC_TR2_LT2_Pos)              /*!< 0x000000FF */
#define ADC_TR2_LT2                    ADC_TR2_LT2_Msk                         /*!< ADC analog watchdog 2 threshold low */
#define ADC_TR2_LT2_0                  (0x01U << ADC_TR2_LT2_Pos)              /*!< 0x00000001 */
#define ADC_TR2_LT2_1                  (0x02U << ADC_TR2_LT2_Pos)              /*!< 0x00000002 */
#define ADC_TR2_LT2_2                  (0x04U << ADC_TR2_LT2_Pos)              /*!< 0x00000004 */
#define ADC_TR2_LT2_3                  (0x08U << ADC_TR2_LT2_Pos)              /*!< 0x00000008 */
#define ADC_TR2_LT2_4                  (0x10U << ADC_TR2_LT2_Pos)              /*!< 0x00000010 */
#define ADC_TR2_LT2_5                  (0x20U << ADC_TR2_LT2_Pos)              /*!< 0x00000020 */
#define ADC_TR2_LT2_6                  (0x40U << ADC_TR2_LT2_Pos)              /*!< 0x00000040 */
#define ADC_TR2_LT2_7                  (0x80U << ADC_TR2_LT2_Pos)              /*!< 0x00000080 */

#define ADC_TR2_HT2_Pos                (16U)                                   
#define ADC_TR2_HT2_Msk                (0xFFU << ADC_TR2_HT2_Pos)              /*!< 0x00FF0000 */
#define ADC_TR2_HT2                    ADC_TR2_HT2_Msk                         /*!< ADC analog watchdog 2 threshold high */
#define ADC_TR2_HT2_0                  (0x01U << ADC_TR2_HT2_Pos)              /*!< 0x00010000 */
#define ADC_TR2_HT2_1                  (0x02U << ADC_TR2_HT2_Pos)              /*!< 0x00020000 */
#define ADC_TR2_HT2_2                  (0x04U << ADC_TR2_HT2_Pos)              /*!< 0x00040000 */
#define ADC_TR2_HT2_3                  (0x08U << ADC_TR2_HT2_Pos)              /*!< 0x00080000 */
#define ADC_TR2_HT2_4                  (0x10U << ADC_TR2_HT2_Pos)              /*!< 0x00100000 */
#define ADC_TR2_HT2_5                  (0x20U << ADC_TR2_HT2_Pos)              /*!< 0x00200000 */
#define ADC_TR2_HT2_6                  (0x40U << ADC_TR2_HT2_Pos)              /*!< 0x00400000 */
#define ADC_TR2_HT2_7                  (0x80U << ADC_TR2_HT2_Pos)              /*!< 0x00800000 */

/********************  Bit definition for ADC_TR3 register  *******************/
#define ADC_TR3_LT3_Pos                (0U)                                    
#define ADC_TR3_LT3_Msk                (0xFFU << ADC_TR3_LT3_Pos)              /*!< 0x000000FF */
#define ADC_TR3_LT3                    ADC_TR3_LT3_Msk                         /*!< ADC analog watchdog 3 threshold low */
#define ADC_TR3_LT3_0                  (0x01U << ADC_TR3_LT3_Pos)              /*!< 0x00000001 */
#define ADC_TR3_LT3_1                  (0x02U << ADC_TR3_LT3_Pos)              /*!< 0x00000002 */
#define ADC_TR3_LT3_2                  (0x04U << ADC_TR3_LT3_Pos)              /*!< 0x00000004 */
#define ADC_TR3_LT3_3                  (0x08U << ADC_TR3_LT3_Pos)              /*!< 0x00000008 */
#define ADC_TR3_LT3_4                  (0x10U << ADC_TR3_LT3_Pos)              /*!< 0x00000010 */
#define ADC_TR3_LT3_5                  (0x20U << ADC_TR3_LT3_Pos)              /*!< 0x00000020 */
#define ADC_TR3_LT3_6                  (0x40U << ADC_TR3_LT3_Pos)              /*!< 0x00000040 */
#define ADC_TR3_LT3_7                  (0x80U << ADC_TR3_LT3_Pos)              /*!< 0x00000080 */

#define ADC_TR3_HT3_Pos                (16U)                                   
#define ADC_TR3_HT3_Msk                (0xFFU << ADC_TR3_HT3_Pos)              /*!< 0x00FF0000 */
#define ADC_TR3_HT3                    ADC_TR3_HT3_Msk                         /*!< ADC analog watchdog 3 threshold high */
#define ADC_TR3_HT3_0                  (0x01U << ADC_TR3_HT3_Pos)              /*!< 0x00010000 */
#define ADC_TR3_HT3_1                  (0x02U << ADC_TR3_HT3_Pos)              /*!< 0x00020000 */
#define ADC_TR3_HT3_2                  (0x04U << ADC_TR3_HT3_Pos)              /*!< 0x00040000 */
#define ADC_TR3_HT3_3                  (0x08U << ADC_TR3_HT3_Pos)              /*!< 0x00080000 */
#define ADC_TR3_HT3_4                  (0x10U << ADC_TR3_HT3_Pos)              /*!< 0x00100000 */
#define ADC_TR3_HT3_5                  (0x20U << ADC_TR3_HT3_Pos)              /*!< 0x00200000 */
#define ADC_TR3_HT3_6                  (0x40U << ADC_TR3_HT3_Pos)              /*!< 0x00400000 */
#define ADC_TR3_HT3_7                  (0x80U << ADC_TR3_HT3_Pos)              /*!< 0x00800000 */

/********************  Bit definition for ADC_SQR1 register  ******************/
#define ADC_SQR1_L_Pos                 (0U)                                    
#define ADC_SQR1_L_Msk                 (0xFU << ADC_SQR1_L_Pos)                /*!< 0x0000000F */
#define ADC_SQR1_L                     ADC_SQR1_L_Msk                          /*!< ADC group regular sequencer scan length */
#define ADC_SQR1_L_0                   (0x1U << ADC_SQR1_L_Pos)                /*!< 0x00000001 */
#define ADC_SQR1_L_1                   (0x2U << ADC_SQR1_L_Pos)                /*!< 0x00000002 */
#define ADC_SQR1_L_2                   (0x4U << ADC_SQR1_L_Pos)                /*!< 0x00000004 */
#define ADC_SQR1_L_3                   (0x8U << ADC_SQR1_L_Pos)                /*!< 0x00000008 */

#define ADC_SQR1_SQ1_Pos               (6U)                                    
#define ADC_SQR1_SQ1_Msk               (0x1FU << ADC_SQR1_SQ1_Pos)             /*!< 0x000007C0 */
#define ADC_SQR1_SQ1                   ADC_SQR1_SQ1_Msk                        /*!< ADC group regular sequencer rank 1 */
#define ADC_SQR1_SQ1_0                 (0x01U << ADC_SQR1_SQ1_Pos)             /*!< 0x00000040 */
#define ADC_SQR1_SQ1_1                 (0x02U << ADC_SQR1_SQ1_Pos)             /*!< 0x00000080 */
#define ADC_SQR1_SQ1_2                 (0x04U << ADC_SQR1_SQ1_Pos)             /*!< 0x00000100 */
#define ADC_SQR1_SQ1_3                 (0x08U << ADC_SQR1_SQ1_Pos)             /*!< 0x00000200 */
#define ADC_SQR1_SQ1_4                 (0x10U << ADC_SQR1_SQ1_Pos)             /*!< 0x00000400 */

#define ADC_SQR1_SQ2_Pos               (12U)                                   
#define ADC_SQR1_SQ2_Msk               (0x1FU << ADC_SQR1_SQ2_Pos)             /*!< 0x0001F000 */
#define ADC_SQR1_SQ2                   ADC_SQR1_SQ2_Msk                        /*!< ADC group regular sequencer rank 2 */
#define ADC_SQR1_SQ2_0                 (0x01U << ADC_SQR1_SQ2_Pos)             /*!< 0x00001000 */
#define ADC_SQR1_SQ2_1                 (0x02U << ADC_SQR1_SQ2_Pos)             /*!< 0x00002000 */
#define ADC_SQR1_SQ2_2                 (0x04U << ADC_SQR1_SQ2_Pos)             /*!< 0x00004000 */
#define ADC_SQR1_SQ2_3                 (0x08U << ADC_SQR1_SQ2_Pos)             /*!< 0x00008000 */
#define ADC_SQR1_SQ2_4                 (0x10U << ADC_SQR1_SQ2_Pos)             /*!< 0x00010000 */

#define ADC_SQR1_SQ3_Pos               (18U)                                   
#define ADC_SQR1_SQ3_Msk               (0x1FU << ADC_SQR1_SQ3_Pos)             /*!< 0x007C0000 */
#define ADC_SQR1_SQ3                   ADC_SQR1_SQ3_Msk                        /*!< ADC group regular sequencer rank 3 */
#define ADC_SQR1_SQ3_0                 (0x01U << ADC_SQR1_SQ3_Pos)             /*!< 0x00040000 */
#define ADC_SQR1_SQ3_1                 (0x02U << ADC_SQR1_SQ3_Pos)             /*!< 0x00080000 */
#define ADC_SQR1_SQ3_2                 (0x04U << ADC_SQR1_SQ3_Pos)             /*!< 0x00100000 */
#define ADC_SQR1_SQ3_3                 (0x08U << ADC_SQR1_SQ3_Pos)             /*!< 0x00200000 */
#define ADC_SQR1_SQ3_4                 (0x10U << ADC_SQR1_SQ3_Pos)             /*!< 0x00400000 */

#define ADC_SQR1_SQ4_Pos               (24U)                                   
#define ADC_SQR1_SQ4_Msk               (0x1FU << ADC_SQR1_SQ4_Pos)             /*!< 0x1F000000 */
#define ADC_SQR1_SQ4                   ADC_SQR1_SQ4_Msk                        /*!< ADC group regular sequencer rank 4 */
#define ADC_SQR1_SQ4_0                 (0x01U << ADC_SQR1_SQ4_Pos)             /*!< 0x01000000 */
#define ADC_SQR1_SQ4_1                 (0x02U << ADC_SQR1_SQ4_Pos)             /*!< 0x02000000 */
#define ADC_SQR1_SQ4_2                 (0x04U << ADC_SQR1_SQ4_Pos)             /*!< 0x04000000 */
#define ADC_SQR1_SQ4_3                 (0x08U << ADC_SQR1_SQ4_Pos)             /*!< 0x08000000 */
#define ADC_SQR1_SQ4_4                 (0x10U << ADC_SQR1_SQ4_Pos)             /*!< 0x10000000 */

/********************  Bit definition for ADC_SQR2 register  ******************/
#define ADC_SQR2_SQ5_Pos               (0U)                                    
#define ADC_SQR2_SQ5_Msk               (0x1FU << ADC_SQR2_SQ5_Pos)             /*!< 0x0000001F */
#define ADC_SQR2_SQ5                   ADC_SQR2_SQ5_Msk                        /*!< ADC group regular sequencer rank 5 */
#define ADC_SQR2_SQ5_0                 (0x01U << ADC_SQR2_SQ5_Pos)             /*!< 0x00000001 */
#define ADC_SQR2_SQ5_1                 (0x02U << ADC_SQR2_SQ5_Pos)             /*!< 0x00000002 */
#define ADC_SQR2_SQ5_2                 (0x04U << ADC_SQR2_SQ5_Pos)             /*!< 0x00000004 */
#define ADC_SQR2_SQ5_3                 (0x08U << ADC_SQR2_SQ5_Pos)             /*!< 0x00000008 */
#define ADC_SQR2_SQ5_4                 (0x10U << ADC_SQR2_SQ5_Pos)             /*!< 0x00000010 */

#define ADC_SQR2_SQ6_Pos               (6U)                                    
#define ADC_SQR2_SQ6_Msk               (0x1FU << ADC_SQR2_SQ6_Pos)             /*!< 0x000007C0 */
#define ADC_SQR2_SQ6                   ADC_SQR2_SQ6_Msk                        /*!< ADC group regular sequencer rank 6 */
#define ADC_SQR2_SQ6_0                 (0x01U << ADC_SQR2_SQ6_Pos)             /*!< 0x00000040 */
#define ADC_SQR2_SQ6_1                 (0x02U << ADC_SQR2_SQ6_Pos)             /*!< 0x00000080 */
#define ADC_SQR2_SQ6_2                 (0x04U << ADC_SQR2_SQ6_Pos)             /*!< 0x00000100 */
#define ADC_SQR2_SQ6_3                 (0x08U << ADC_SQR2_SQ6_Pos)             /*!< 0x00000200 */
#define ADC_SQR2_SQ6_4                 (0x10U << ADC_SQR2_SQ6_Pos)             /*!< 0x00000400 */

#define ADC_SQR2_SQ7_Pos               (12U)                                   
#define ADC_SQR2_SQ7_Msk               (0x1FU << ADC_SQR2_SQ7_Pos)             /*!< 0x0001F000 */
#define ADC_SQR2_SQ7                   ADC_SQR2_SQ7_Msk                        /*!< ADC group regular sequencer rank 7 */
#define ADC_SQR2_SQ7_0                 (0x01U << ADC_SQR2_SQ7_Pos)             /*!< 0x00001000 */
#define ADC_SQR2_SQ7_1                 (0x02U << ADC_SQR2_SQ7_Pos)             /*!< 0x00002000 */
#define ADC_SQR2_SQ7_2                 (0x04U << ADC_SQR2_SQ7_Pos)             /*!< 0x00004000 */
#define ADC_SQR2_SQ7_3                 (0x08U << ADC_SQR2_SQ7_Pos)             /*!< 0x00008000 */
#define ADC_SQR2_SQ7_4                 (0x10U << ADC_SQR2_SQ7_Pos)             /*!< 0x00010000 */

#define ADC_SQR2_SQ8_Pos               (18U)                                   
#define ADC_SQR2_SQ8_Msk               (0x1FU << ADC_SQR2_SQ8_Pos)             /*!< 0x007C0000 */
#define ADC_SQR2_SQ8                   ADC_SQR2_SQ8_Msk                        /*!< ADC group regular sequencer rank 8 */
#define ADC_SQR2_SQ8_0                 (0x01U << ADC_SQR2_SQ8_Pos)             /*!< 0x00040000 */
#define ADC_SQR2_SQ8_1                 (0x02U << ADC_SQR2_SQ8_Pos)             /*!< 0x00080000 */
#define ADC_SQR2_SQ8_2                 (0x04U << ADC_SQR2_SQ8_Pos)             /*!< 0x00100000 */
#define ADC_SQR2_SQ8_3                 (0x08U << ADC_SQR2_SQ8_Pos)             /*!< 0x00200000 */
#define ADC_SQR2_SQ8_4                 (0x10U << ADC_SQR2_SQ8_Pos)             /*!< 0x00400000 */

#define ADC_SQR2_SQ9_Pos               (24U)                                   
#define ADC_SQR2_SQ9_Msk               (0x1FU << ADC_SQR2_SQ9_Pos)             /*!< 0x1F000000 */
#define ADC_SQR2_SQ9                   ADC_SQR2_SQ9_Msk                        /*!< ADC group regular sequencer rank 9 */
#define ADC_SQR2_SQ9_0                 (0x01U << ADC_SQR2_SQ9_Pos)             /*!< 0x01000000 */
#define ADC_SQR2_SQ9_1                 (0x02U << ADC_SQR2_SQ9_Pos)             /*!< 0x02000000 */
#define ADC_SQR2_SQ9_2                 (0x04U << ADC_SQR2_SQ9_Pos)             /*!< 0x04000000 */
#define ADC_SQR2_SQ9_3                 (0x08U << ADC_SQR2_SQ9_Pos)             /*!< 0x08000000 */
#define ADC_SQR2_SQ9_4                 (0x10U << ADC_SQR2_SQ9_Pos)             /*!< 0x10000000 */

/********************  Bit definition for ADC_SQR3 register  ******************/
#define ADC_SQR3_SQ10_Pos              (0U)                                    
#define ADC_SQR3_SQ10_Msk              (0x1FU << ADC_SQR3_SQ10_Pos)            /*!< 0x0000001F */
#define ADC_SQR3_SQ10                  ADC_SQR3_SQ10_Msk                       /*!< ADC group regular sequencer rank 10 */
#define ADC_SQR3_SQ10_0                (0x01U << ADC_SQR3_SQ10_Pos)            /*!< 0x00000001 */
#define ADC_SQR3_SQ10_1                (0x02U << ADC_SQR3_SQ10_Pos)            /*!< 0x00000002 */
#define ADC_SQR3_SQ10_2                (0x04U << ADC_SQR3_SQ10_Pos)            /*!< 0x00000004 */
#define ADC_SQR3_SQ10_3                (0x08U << ADC_SQR3_SQ10_Pos)            /*!< 0x00000008 */
#define ADC_SQR3_SQ10_4                (0x10U << ADC_SQR3_SQ10_Pos)            /*!< 0x00000010 */

#define ADC_SQR3_SQ11_Pos              (6U)                                    
#define ADC_SQR3_SQ11_Msk              (0x1FU << ADC_SQR3_SQ11_Pos)            /*!< 0x000007C0 */
#define ADC_SQR3_SQ11                  ADC_SQR3_SQ11_Msk                       /*!< ADC group regular sequencer rank 11 */
#define ADC_SQR3_SQ11_0                (0x01U << ADC_SQR3_SQ11_Pos)            /*!< 0x00000040 */
#define ADC_SQR3_SQ11_1                (0x02U << ADC_SQR3_SQ11_Pos)            /*!< 0x00000080 */
#define ADC_SQR3_SQ11_2                (0x04U << ADC_SQR3_SQ11_Pos)            /*!< 0x00000100 */
#define ADC_SQR3_SQ11_3                (0x08U << ADC_SQR3_SQ11_Pos)            /*!< 0x00000200 */
#define ADC_SQR3_SQ11_4                (0x10U << ADC_SQR3_SQ11_Pos)            /*!< 0x00000400 */

#define ADC_SQR3_SQ12_Pos              (12U)                                   
#define ADC_SQR3_SQ12_Msk              (0x1FU << ADC_SQR3_SQ12_Pos)            /*!< 0x0001F000 */
#define ADC_SQR3_SQ12                  ADC_SQR3_SQ12_Msk                       /*!< ADC group regular sequencer rank 12 */
#define ADC_SQR3_SQ12_0                (0x01U << ADC_SQR3_SQ12_Pos)            /*!< 0x00001000 */
#define ADC_SQR3_SQ12_1                (0x02U << ADC_SQR3_SQ12_Pos)            /*!< 0x00002000 */
#define ADC_SQR3_SQ12_2                (0x04U << ADC_SQR3_SQ12_Pos)            /*!< 0x00004000 */
#define ADC_SQR3_SQ12_3                (0x08U << ADC_SQR3_SQ12_Pos)            /*!< 0x00008000 */
#define ADC_SQR3_SQ12_4                (0x10U << ADC_SQR3_SQ12_Pos)            /*!< 0x00010000 */

#define ADC_SQR3_SQ13_Pos              (18U)                                   
#define ADC_SQR3_SQ13_Msk              (0x1FU << ADC_SQR3_SQ13_Pos)            /*!< 0x007C0000 */
#define ADC_SQR3_SQ13                  ADC_SQR3_SQ13_Msk                       /*!< ADC group regular sequencer rank 13 */
#define ADC_SQR3_SQ13_0                (0x01U << ADC_SQR3_SQ13_Pos)            /*!< 0x00040000 */
#define ADC_SQR3_SQ13_1                (0x02U << ADC_SQR3_SQ13_Pos)            /*!< 0x00080000 */
#define ADC_SQR3_SQ13_2                (0x04U << ADC_SQR3_SQ13_Pos)            /*!< 0x00100000 */
#define ADC_SQR3_SQ13_3                (0x08U << ADC_SQR3_SQ13_Pos)            /*!< 0x00200000 */
#define ADC_SQR3_SQ13_4                (0x10U << ADC_SQR3_SQ13_Pos)            /*!< 0x00400000 */

#define ADC_SQR3_SQ14_Pos              (24U)                                   
#define ADC_SQR3_SQ14_Msk              (0x1FU << ADC_SQR3_SQ14_Pos)            /*!< 0x1F000000 */
#define ADC_SQR3_SQ14                  ADC_SQR3_SQ14_Msk                       /*!< ADC group regular sequencer rank 14 */
#define ADC_SQR3_SQ14_0                (0x01U << ADC_SQR3_SQ14_Pos)            /*!< 0x01000000 */
#define ADC_SQR3_SQ14_1                (0x02U << ADC_SQR3_SQ14_Pos)            /*!< 0x02000000 */
#define ADC_SQR3_SQ14_2                (0x04U << ADC_SQR3_SQ14_Pos)            /*!< 0x04000000 */
#define ADC_SQR3_SQ14_3                (0x08U << ADC_SQR3_SQ14_Pos)            /*!< 0x08000000 */
#define ADC_SQR3_SQ14_4                (0x10U << ADC_SQR3_SQ14_Pos)            /*!< 0x10000000 */

/********************  Bit definition for ADC_SQR4 register  ******************/
#define ADC_SQR4_SQ15_Pos              (0U)                                    
#define ADC_SQR4_SQ15_Msk              (0x1FU << ADC_SQR4_SQ15_Pos)            /*!< 0x0000001F */
#define ADC_SQR4_SQ15                  ADC_SQR4_SQ15_Msk                       /*!< ADC group regular sequencer rank 15 */
#define ADC_SQR4_SQ15_0                (0x01U << ADC_SQR4_SQ15_Pos)            /*!< 0x00000001 */
#define ADC_SQR4_SQ15_1                (0x02U << ADC_SQR4_SQ15_Pos)            /*!< 0x00000002 */
#define ADC_SQR4_SQ15_2                (0x04U << ADC_SQR4_SQ15_Pos)            /*!< 0x00000004 */
#define ADC_SQR4_SQ15_3                (0x08U << ADC_SQR4_SQ15_Pos)            /*!< 0x00000008 */
#define ADC_SQR4_SQ15_4                (0x10U << ADC_SQR4_SQ15_Pos)            /*!< 0x00000010 */

#define ADC_SQR4_SQ16_Pos              (6U)                                    
#define ADC_SQR4_SQ16_Msk              (0x1FU << ADC_SQR4_SQ16_Pos)            /*!< 0x000007C0 */
#define ADC_SQR4_SQ16                  ADC_SQR4_SQ16_Msk                       /*!< ADC group regular sequencer rank 16 */
#define ADC_SQR4_SQ16_0                (0x01U << ADC_SQR4_SQ16_Pos)            /*!< 0x00000040 */
#define ADC_SQR4_SQ16_1                (0x02U << ADC_SQR4_SQ16_Pos)            /*!< 0x00000080 */
#define ADC_SQR4_SQ16_2                (0x04U << ADC_SQR4_SQ16_Pos)            /*!< 0x00000100 */
#define ADC_SQR4_SQ16_3                (0x08U << ADC_SQR4_SQ16_Pos)            /*!< 0x00000200 */
#define ADC_SQR4_SQ16_4                (0x10U << ADC_SQR4_SQ16_Pos)            /*!< 0x00000400 */

/********************  Bit definition for ADC_DR register  ********************/
#define ADC_DR_RDATA_Pos               (0U)                                    
#define ADC_DR_RDATA_Msk               (0xFFFFU << ADC_DR_RDATA_Pos)           /*!< 0x0000FFFF */
#define ADC_DR_RDATA                   ADC_DR_RDATA_Msk                        /*!< ADC group regular conversion data */
#define ADC_DR_RDATA_0                 (0x0001U << ADC_DR_RDATA_Pos)           /*!< 0x00000001 */
#define ADC_DR_RDATA_1                 (0x0002U << ADC_DR_RDATA_Pos)           /*!< 0x00000002 */
#define ADC_DR_RDATA_2                 (0x0004U << ADC_DR_RDATA_Pos)           /*!< 0x00000004 */
#define ADC_DR_RDATA_3                 (0x0008U << ADC_DR_RDATA_Pos)           /*!< 0x00000008 */
#define ADC_DR_RDATA_4                 (0x0010U << ADC_DR_RDATA_Pos)           /*!< 0x00000010 */
#define ADC_DR_RDATA_5                 (0x0020U << ADC_DR_RDATA_Pos)           /*!< 0x00000020 */
#define ADC_DR_RDATA_6                 (0x0040U << ADC_DR_RDATA_Pos)           /*!< 0x00000040 */
#define ADC_DR_RDATA_7                 (0x0080U << ADC_DR_RDATA_Pos)           /*!< 0x00000080 */
#define ADC_DR_RDATA_8                 (0x0100U << ADC_DR_RDATA_Pos)           /*!< 0x00000100 */
#define ADC_DR_RDATA_9                 (0x0200U << ADC_DR_RDATA_Pos)           /*!< 0x00000200 */
#define ADC_DR_RDATA_10                (0x0400U << ADC_DR_RDATA_Pos)           /*!< 0x00000400 */
#define ADC_DR_RDATA_11                (0x0800U << ADC_DR_RDATA_Pos)           /*!< 0x00000800 */
#define ADC_DR_RDATA_12                (0x1000U << ADC_DR_RDATA_Pos)           /*!< 0x00001000 */
#define ADC_DR_RDATA_13                (0x2000U << ADC_DR_RDATA_Pos)           /*!< 0x00002000 */
#define ADC_DR_RDATA_14                (0x4000U << ADC_DR_RDATA_Pos)           /*!< 0x00004000 */
#define ADC_DR_RDATA_15                (0x8000U << ADC_DR_RDATA_Pos)           /*!< 0x00008000 */

/********************  Bit definition for ADC_JSQR register  ******************/
#define ADC_JSQR_JL_Pos                (0U)                                    
#define ADC_JSQR_JL_Msk                (0x3U << ADC_JSQR_JL_Pos)               /*!< 0x00000003 */
#define ADC_JSQR_JL                    ADC_JSQR_JL_Msk                         /*!< ADC group injected sequencer scan length */
#define ADC_JSQR_JL_0                  (0x1U << ADC_JSQR_JL_Pos)               /*!< 0x00000001 */
#define ADC_JSQR_JL_1                  (0x2U << ADC_JSQR_JL_Pos)               /*!< 0x00000002 */

#define ADC_JSQR_JEXTSEL_Pos           (2U)                                    
#define ADC_JSQR_JEXTSEL_Msk           (0xFU << ADC_JSQR_JEXTSEL_Pos)          /*!< 0x0000003C */
#define ADC_JSQR_JEXTSEL               ADC_JSQR_JEXTSEL_Msk                    /*!< ADC group injected external trigger source */
#define ADC_JSQR_JEXTSEL_0             (0x1U << ADC_JSQR_JEXTSEL_Pos)          /*!< 0x00000004 */
#define ADC_JSQR_JEXTSEL_1             (0x2U << ADC_JSQR_JEXTSEL_Pos)          /*!< 0x00000008 */
#define ADC_JSQR_JEXTSEL_2             (0x4U << ADC_JSQR_JEXTSEL_Pos)          /*!< 0x00000010 */
#define ADC_JSQR_JEXTSEL_3             (0x8U << ADC_JSQR_JEXTSEL_Pos)          /*!< 0x00000020 */

#define ADC_JSQR_JEXTEN_Pos            (6U)                                    
#define ADC_JSQR_JEXTEN_Msk            (0x3U << ADC_JSQR_JEXTEN_Pos)           /*!< 0x000000C0 */
#define ADC_JSQR_JEXTEN                ADC_JSQR_JEXTEN_Msk                     /*!< ADC group injected external trigger polarity */
#define ADC_JSQR_JEXTEN_0              (0x1U << ADC_JSQR_JEXTEN_Pos)           /*!< 0x00000040 */
#define ADC_JSQR_JEXTEN_1              (0x2U << ADC_JSQR_JEXTEN_Pos)           /*!< 0x00000080 */

#define ADC_JSQR_JSQ1_Pos              (8U)                                    
#define ADC_JSQR_JSQ1_Msk              (0x1FU << ADC_JSQR_JSQ1_Pos)            /*!< 0x00001F00 */
#define ADC_JSQR_JSQ1                  ADC_JSQR_JSQ1_Msk                       /*!< ADC group injected sequencer rank 1 */
#define ADC_JSQR_JSQ1_0                (0x01U << ADC_JSQR_JSQ1_Pos)            /*!< 0x00000100 */
#define ADC_JSQR_JSQ1_1                (0x02U << ADC_JSQR_JSQ1_Pos)            /*!< 0x00000200 */
#define ADC_JSQR_JSQ1_2                (0x04U << ADC_JSQR_JSQ1_Pos)            /*!< 0x00000400 */
#define ADC_JSQR_JSQ1_3                (0x08U << ADC_JSQR_JSQ1_Pos)            /*!< 0x00000800 */
#define ADC_JSQR_JSQ1_4                (0x10U << ADC_JSQR_JSQ1_Pos)            /*!< 0x00001000 */

#define ADC_JSQR_JSQ2_Pos              (14U)                                   
#define ADC_JSQR_JSQ2_Msk              (0x1FU << ADC_JSQR_JSQ2_Pos)            /*!< 0x0007C000 */
#define ADC_JSQR_JSQ2                  ADC_JSQR_JSQ2_Msk                       /*!< ADC group injected sequencer rank 2 */
#define ADC_JSQR_JSQ2_0                (0x01U << ADC_JSQR_JSQ2_Pos)            /*!< 0x00004000 */
#define ADC_JSQR_JSQ2_1                (0x02U << ADC_JSQR_JSQ2_Pos)            /*!< 0x00008000 */
#define ADC_JSQR_JSQ2_2                (0x04U << ADC_JSQR_JSQ2_Pos)            /*!< 0x00010000 */
#define ADC_JSQR_JSQ2_3                (0x08U << ADC_JSQR_JSQ2_Pos)            /*!< 0x00020000 */
#define ADC_JSQR_JSQ2_4                (0x10U << ADC_JSQR_JSQ2_Pos)            /*!< 0x00040000 */

#define ADC_JSQR_JSQ3_Pos              (20U)                                   
#define ADC_JSQR_JSQ3_Msk              (0x1FU << ADC_JSQR_JSQ3_Pos)            /*!< 0x01F00000 */
#define ADC_JSQR_JSQ3                  ADC_JSQR_JSQ3_Msk                       /*!< ADC group injected sequencer rank 3 */
#define ADC_JSQR_JSQ3_0                (0x01U << ADC_JSQR_JSQ3_Pos)            /*!< 0x00100000 */
#define ADC_JSQR_JSQ3_1                (0x02U << ADC_JSQR_JSQ3_Pos)            /*!< 0x00200000 */
#define ADC_JSQR_JSQ3_2                (0x04U << ADC_JSQR_JSQ3_Pos)            /*!< 0x00400000 */
#define ADC_JSQR_JSQ3_3                (0x08U << ADC_JSQR_JSQ3_Pos)            /*!< 0x00800000 */
#define ADC_JSQR_JSQ3_4                (0x10U << ADC_JSQR_JSQ3_Pos)            /*!< 0x01000000 */

#define ADC_JSQR_JSQ4_Pos              (26U)                                   
#define ADC_JSQR_JSQ4_Msk              (0x1FU << ADC_JSQR_JSQ4_Pos)            /*!< 0x7C000000 */
#define ADC_JSQR_JSQ4                  ADC_JSQR_JSQ4_Msk                       /*!< ADC group injected sequencer rank 4 */
#define ADC_JSQR_JSQ4_0                (0x01U << ADC_JSQR_JSQ4_Pos)            /*!< 0x04000000 */
#define ADC_JSQR_JSQ4_1                (0x02U << ADC_JSQR_JSQ4_Pos)            /*!< 0x08000000 */
#define ADC_JSQR_JSQ4_2                (0x04U << ADC_JSQR_JSQ4_Pos)            /*!< 0x10000000 */
#define ADC_JSQR_JSQ4_3                (0x08U << ADC_JSQR_JSQ4_Pos)            /*!< 0x20000000 */
#define ADC_JSQR_JSQ4_4                (0x10U << ADC_JSQR_JSQ4_Pos)            /*!< 0x40000000 */

/********************  Bit definition for ADC_OFR1 register  ******************/
#define ADC_OFR1_OFFSET1_Pos           (0U)                                    
#define ADC_OFR1_OFFSET1_Msk           (0xFFFU << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000FFF */
#define ADC_OFR1_OFFSET1               ADC_OFR1_OFFSET1_Msk                    /*!< ADC offset number 1 offset level */
#define ADC_OFR1_OFFSET1_0             (0x001U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000001 */
#define ADC_OFR1_OFFSET1_1             (0x002U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000002 */
#define ADC_OFR1_OFFSET1_2             (0x004U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000004 */
#define ADC_OFR1_OFFSET1_3             (0x008U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000008 */
#define ADC_OFR1_OFFSET1_4             (0x010U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000010 */
#define ADC_OFR1_OFFSET1_5             (0x020U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000020 */
#define ADC_OFR1_OFFSET1_6             (0x040U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000040 */
#define ADC_OFR1_OFFSET1_7             (0x080U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000080 */
#define ADC_OFR1_OFFSET1_8             (0x100U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000100 */
#define ADC_OFR1_OFFSET1_9             (0x200U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000200 */
#define ADC_OFR1_OFFSET1_10            (0x400U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000400 */
#define ADC_OFR1_OFFSET1_11            (0x800U << ADC_OFR1_OFFSET1_Pos)        /*!< 0x00000800 */

#define ADC_OFR1_OFFSET1_CH_Pos        (26U)                                   
#define ADC_OFR1_OFFSET1_CH_Msk        (0x1FU << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x7C000000 */
#define ADC_OFR1_OFFSET1_CH            ADC_OFR1_OFFSET1_CH_Msk                 /*!< ADC offset number 1 channel selection */
#define ADC_OFR1_OFFSET1_CH_0          (0x01U << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x04000000 */
#define ADC_OFR1_OFFSET1_CH_1          (0x02U << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x08000000 */
#define ADC_OFR1_OFFSET1_CH_2          (0x04U << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x10000000 */
#define ADC_OFR1_OFFSET1_CH_3          (0x08U << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x20000000 */
#define ADC_OFR1_OFFSET1_CH_4          (0x10U << ADC_OFR1_OFFSET1_CH_Pos)      /*!< 0x40000000 */

#define ADC_OFR1_OFFSET1_EN_Pos        (31U)                                   
#define ADC_OFR1_OFFSET1_EN_Msk        (0x1U << ADC_OFR1_OFFSET1_EN_Pos)       /*!< 0x80000000 */
#define ADC_OFR1_OFFSET1_EN            ADC_OFR1_OFFSET1_EN_Msk                 /*!< ADC offset number 1 enable */

/********************  Bit definition for ADC_OFR2 register  ******************/
#define ADC_OFR2_OFFSET2_Pos           (0U)                                    
#define ADC_OFR2_OFFSET2_Msk           (0xFFFU << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000FFF */
#define ADC_OFR2_OFFSET2               ADC_OFR2_OFFSET2_Msk                    /*!< ADC offset number 2 offset level */
#define ADC_OFR2_OFFSET2_0             (0x001U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000001 */
#define ADC_OFR2_OFFSET2_1             (0x002U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000002 */
#define ADC_OFR2_OFFSET2_2             (0x004U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000004 */
#define ADC_OFR2_OFFSET2_3             (0x008U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000008 */
#define ADC_OFR2_OFFSET2_4             (0x010U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000010 */
#define ADC_OFR2_OFFSET2_5             (0x020U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000020 */
#define ADC_OFR2_OFFSET2_6             (0x040U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000040 */
#define ADC_OFR2_OFFSET2_7             (0x080U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000080 */
#define ADC_OFR2_OFFSET2_8             (0x100U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000100 */
#define ADC_OFR2_OFFSET2_9             (0x200U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000200 */
#define ADC_OFR2_OFFSET2_10            (0x400U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000400 */
#define ADC_OFR2_OFFSET2_11            (0x800U << ADC_OFR2_OFFSET2_Pos)        /*!< 0x00000800 */

#define ADC_OFR2_OFFSET2_CH_Pos        (26U)                                   
#define ADC_OFR2_OFFSET2_CH_Msk        (0x1FU << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x7C000000 */
#define ADC_OFR2_OFFSET2_CH            ADC_OFR2_OFFSET2_CH_Msk                 /*!< ADC offset number 2 channel selection */
#define ADC_OFR2_OFFSET2_CH_0          (0x01U << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x04000000 */
#define ADC_OFR2_OFFSET2_CH_1          (0x02U << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x08000000 */
#define ADC_OFR2_OFFSET2_CH_2          (0x04U << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x10000000 */
#define ADC_OFR2_OFFSET2_CH_3          (0x08U << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x20000000 */
#define ADC_OFR2_OFFSET2_CH_4          (0x10U << ADC_OFR2_OFFSET2_CH_Pos)      /*!< 0x40000000 */

#define ADC_OFR2_OFFSET2_EN_Pos        (31U)                                   
#define ADC_OFR2_OFFSET2_EN_Msk        (0x1U << ADC_OFR2_OFFSET2_EN_Pos)       /*!< 0x80000000 */
#define ADC_OFR2_OFFSET2_EN            ADC_OFR2_OFFSET2_EN_Msk                 /*!< ADC offset number 2 enable */

/********************  Bit definition for ADC_OFR3 register  ******************/
#define ADC_OFR3_OFFSET3_Pos           (0U)                                    
#define ADC_OFR3_OFFSET3_Msk           (0xFFFU << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000FFF */
#define ADC_OFR3_OFFSET3               ADC_OFR3_OFFSET3_Msk                    /*!< ADC offset number 3 offset level */
#define ADC_OFR3_OFFSET3_0             (0x001U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000001 */
#define ADC_OFR3_OFFSET3_1             (0x002U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000002 */
#define ADC_OFR3_OFFSET3_2             (0x004U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000004 */
#define ADC_OFR3_OFFSET3_3             (0x008U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000008 */
#define ADC_OFR3_OFFSET3_4             (0x010U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000010 */
#define ADC_OFR3_OFFSET3_5             (0x020U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000020 */
#define ADC_OFR3_OFFSET3_6             (0x040U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000040 */
#define ADC_OFR3_OFFSET3_7             (0x080U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000080 */
#define ADC_OFR3_OFFSET3_8             (0x100U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000100 */
#define ADC_OFR3_OFFSET3_9             (0x200U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000200 */
#define ADC_OFR3_OFFSET3_10            (0x400U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000400 */
#define ADC_OFR3_OFFSET3_11            (0x800U << ADC_OFR3_OFFSET3_Pos)        /*!< 0x00000800 */

#define ADC_OFR3_OFFSET3_CH_Pos        (26U)                                   
#define ADC_OFR3_OFFSET3_CH_Msk        (0x1FU << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x7C000000 */
#define ADC_OFR3_OFFSET3_CH            ADC_OFR3_OFFSET3_CH_Msk                 /*!< ADC offset number 3 channel selection */
#define ADC_OFR3_OFFSET3_CH_0          (0x01U << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x04000000 */
#define ADC_OFR3_OFFSET3_CH_1          (0x02U << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x08000000 */
#define ADC_OFR3_OFFSET3_CH_2          (0x04U << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x10000000 */
#define ADC_OFR3_OFFSET3_CH_3          (0x08U << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x20000000 */
#define ADC_OFR3_OFFSET3_CH_4          (0x10U << ADC_OFR3_OFFSET3_CH_Pos)      /*!< 0x40000000 */

#define ADC_OFR3_OFFSET3_EN_Pos        (31U)                                   
#define ADC_OFR3_OFFSET3_EN_Msk        (0x1U << ADC_OFR3_OFFSET3_EN_Pos)       /*!< 0x80000000 */
#define ADC_OFR3_OFFSET3_EN            ADC_OFR3_OFFSET3_EN_Msk                 /*!< ADC offset number 3 enable */

/********************  Bit definition for ADC_OFR4 register  ******************/
#define ADC_OFR4_OFFSET4_Pos           (0U)                                    
#define ADC_OFR4_OFFSET4_Msk           (0xFFFU << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000FFF */
#define ADC_OFR4_OFFSET4               ADC_OFR4_OFFSET4_Msk                    /*!< ADC offset number 4 offset level */
#define ADC_OFR4_OFFSET4_0             (0x001U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000001 */
#define ADC_OFR4_OFFSET4_1             (0x002U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000002 */
#define ADC_OFR4_OFFSET4_2             (0x004U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000004 */
#define ADC_OFR4_OFFSET4_3             (0x008U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000008 */
#define ADC_OFR4_OFFSET4_4             (0x010U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000010 */
#define ADC_OFR4_OFFSET4_5             (0x020U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000020 */
#define ADC_OFR4_OFFSET4_6             (0x040U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000040 */
#define ADC_OFR4_OFFSET4_7             (0x080U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000080 */
#define ADC_OFR4_OFFSET4_8             (0x100U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000100 */
#define ADC_OFR4_OFFSET4_9             (0x200U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000200 */
#define ADC_OFR4_OFFSET4_10            (0x400U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000400 */
#define ADC_OFR4_OFFSET4_11            (0x800U << ADC_OFR4_OFFSET4_Pos)        /*!< 0x00000800 */

#define ADC_OFR4_OFFSET4_CH_Pos        (26U)                                   
#define ADC_OFR4_OFFSET4_CH_Msk        (0x1FU << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x7C000000 */
#define ADC_OFR4_OFFSET4_CH            ADC_OFR4_OFFSET4_CH_Msk                 /*!< ADC offset number 4 channel selection */
#define ADC_OFR4_OFFSET4_CH_0          (0x01U << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x04000000 */
#define ADC_OFR4_OFFSET4_CH_1          (0x02U << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x08000000 */
#define ADC_OFR4_OFFSET4_CH_2          (0x04U << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x10000000 */
#define ADC_OFR4_OFFSET4_CH_3          (0x08U << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x20000000 */
#define ADC_OFR4_OFFSET4_CH_4          (0x10U << ADC_OFR4_OFFSET4_CH_Pos)      /*!< 0x40000000 */

#define ADC_OFR4_OFFSET4_EN_Pos        (31U)                                   
#define ADC_OFR4_OFFSET4_EN_Msk        (0x1U << ADC_OFR4_OFFSET4_EN_Pos)       /*!< 0x80000000 */
#define ADC_OFR4_OFFSET4_EN            ADC_OFR4_OFFSET4_EN_Msk                 /*!< ADC offset number 4 enable */

/********************  Bit definition for ADC_JDR1 register  ******************/
#define ADC_JDR1_JDATA_Pos             (0U)                                    
#define ADC_JDR1_JDATA_Msk             (0xFFFFU << ADC_JDR1_JDATA_Pos)         /*!< 0x0000FFFF */
#define ADC_JDR1_JDATA                 ADC_JDR1_JDATA_Msk                      /*!< ADC group injected sequencer rank 1 conversion data */
#define ADC_JDR1_JDATA_0               (0x0001U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000001 */
#define ADC_JDR1_JDATA_1               (0x0002U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000002 */
#define ADC_JDR1_JDATA_2               (0x0004U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000004 */
#define ADC_JDR1_JDATA_3               (0x0008U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000008 */
#define ADC_JDR1_JDATA_4               (0x0010U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000010 */
#define ADC_JDR1_JDATA_5               (0x0020U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000020 */
#define ADC_JDR1_JDATA_6               (0x0040U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000040 */
#define ADC_JDR1_JDATA_7               (0x0080U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000080 */
#define ADC_JDR1_JDATA_8               (0x0100U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000100 */
#define ADC_JDR1_JDATA_9               (0x0200U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000200 */
#define ADC_JDR1_JDATA_10              (0x0400U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000400 */
#define ADC_JDR1_JDATA_11              (0x0800U << ADC_JDR1_JDATA_Pos)         /*!< 0x00000800 */
#define ADC_JDR1_JDATA_12              (0x1000U << ADC_JDR1_JDATA_Pos)         /*!< 0x00001000 */
#define ADC_JDR1_JDATA_13              (0x2000U << ADC_JDR1_JDATA_Pos)         /*!< 0x00002000 */
#define ADC_JDR1_JDATA_14              (0x4000U << ADC_JDR1_JDATA_Pos)         /*!< 0x00004000 */
#define ADC_JDR1_JDATA_15              (0x8000U << ADC_JDR1_JDATA_Pos)         /*!< 0x00008000 */

/********************  Bit definition for ADC_JDR2 register  ******************/
#define ADC_JDR2_JDATA_Pos             (0U)                                    
#define ADC_JDR2_JDATA_Msk             (0xFFFFU << ADC_JDR2_JDATA_Pos)         /*!< 0x0000FFFF */
#define ADC_JDR2_JDATA                 ADC_JDR2_JDATA_Msk                      /*!< ADC group injected sequencer rank 2 conversion data */
#define ADC_JDR2_JDATA_0               (0x0001U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000001 */
#define ADC_JDR2_JDATA_1               (0x0002U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000002 */
#define ADC_JDR2_JDATA_2               (0x0004U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000004 */
#define ADC_JDR2_JDATA_3               (0x0008U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000008 */
#define ADC_JDR2_JDATA_4               (0x0010U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000010 */
#define ADC_JDR2_JDATA_5               (0x0020U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000020 */
#define ADC_JDR2_JDATA_6               (0x0040U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000040 */
#define ADC_JDR2_JDATA_7               (0x0080U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000080 */
#define ADC_JDR2_JDATA_8               (0x0100U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000100 */
#define ADC_JDR2_JDATA_9               (0x0200U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000200 */
#define ADC_JDR2_JDATA_10              (0x0400U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000400 */
#define ADC_JDR2_JDATA_11              (0x0800U << ADC_JDR2_JDATA_Pos)         /*!< 0x00000800 */
#define ADC_JDR2_JDATA_12              (0x1000U << ADC_JDR2_JDATA_Pos)         /*!< 0x00001000 */
#define ADC_JDR2_JDATA_13              (0x2000U << ADC_JDR2_JDATA_Pos)         /*!< 0x00002000 */
#define ADC_JDR2_JDATA_14              (0x4000U << ADC_JDR2_JDATA_Pos)         /*!< 0x00004000 */
#define ADC_JDR2_JDATA_15              (0x8000U << ADC_JDR2_JDATA_Pos)         /*!< 0x00008000 */

/********************  Bit definition for ADC_JDR3 register  ******************/
#define ADC_JDR3_JDATA_Pos             (0U)                                    
#define ADC_JDR3_JDATA_Msk             (0xFFFFU << ADC_JDR3_JDATA_Pos)         /*!< 0x0000FFFF */
#define ADC_JDR3_JDATA                 ADC_JDR3_JDATA_Msk                      /*!< ADC group injected sequencer rank 3 conversion data */
#define ADC_JDR3_JDATA_0               (0x0001U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000001 */
#define ADC_JDR3_JDATA_1               (0x0002U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000002 */
#define ADC_JDR3_JDATA_2               (0x0004U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000004 */
#define ADC_JDR3_JDATA_3               (0x0008U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000008 */
#define ADC_JDR3_JDATA_4               (0x0010U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000010 */
#define ADC_JDR3_JDATA_5               (0x0020U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000020 */
#define ADC_JDR3_JDATA_6               (0x0040U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000040 */
#define ADC_JDR3_JDATA_7               (0x0080U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000080 */
#define ADC_JDR3_JDATA_8               (0x0100U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000100 */
#define ADC_JDR3_JDATA_9               (0x0200U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000200 */
#define ADC_JDR3_JDATA_10              (0x0400U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000400 */
#define ADC_JDR3_JDATA_11              (0x0800U << ADC_JDR3_JDATA_Pos)         /*!< 0x00000800 */
#define ADC_JDR3_JDATA_12              (0x1000U << ADC_JDR3_JDATA_Pos)         /*!< 0x00001000 */
#define ADC_JDR3_JDATA_13              (0x2000U << ADC_JDR3_JDATA_Pos)         /*!< 0x00002000 */
#define ADC_JDR3_JDATA_14              (0x4000U << ADC_JDR3_JDATA_Pos)         /*!< 0x00004000 */
#define ADC_JDR3_JDATA_15              (0x8000U << ADC_JDR3_JDATA_Pos)         /*!< 0x00008000 */

/********************  Bit definition for ADC_JDR4 register  ******************/
#define ADC_JDR4_JDATA_Pos             (0U)                                    
#define ADC_JDR4_JDATA_Msk             (0xFFFFU << ADC_JDR4_JDATA_Pos)         /*!< 0x0000FFFF */
#define ADC_JDR4_JDATA                 ADC_JDR4_JDATA_Msk                      /*!< ADC group injected sequencer rank 4 conversion data */
#define ADC_JDR4_JDATA_0               (0x0001U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000001 */
#define ADC_JDR4_JDATA_1               (0x0002U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000002 */
#define ADC_JDR4_JDATA_2               (0x0004U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000004 */
#define ADC_JDR4_JDATA_3               (0x0008U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000008 */
#define ADC_JDR4_JDATA_4               (0x0010U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000010 */
#define ADC_JDR4_JDATA_5               (0x0020U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000020 */
#define ADC_JDR4_JDATA_6               (0x0040U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000040 */
#define ADC_JDR4_JDATA_7               (0x0080U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000080 */
#define ADC_JDR4_JDATA_8               (0x0100U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000100 */
#define ADC_JDR4_JDATA_9               (0x0200U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000200 */
#define ADC_JDR4_JDATA_10              (0x0400U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000400 */
#define ADC_JDR4_JDATA_11              (0x0800U << ADC_JDR4_JDATA_Pos)         /*!< 0x00000800 */
#define ADC_JDR4_JDATA_12              (0x1000U << ADC_JDR4_JDATA_Pos)         /*!< 0x00001000 */
#define ADC_JDR4_JDATA_13              (0x2000U << ADC_JDR4_JDATA_Pos)         /*!< 0x00002000 */
#define ADC_JDR4_JDATA_14              (0x4000U << ADC_JDR4_JDATA_Pos)         /*!< 0x00004000 */
#define ADC_JDR4_JDATA_15              (0x8000U << ADC_JDR4_JDATA_Pos)         /*!< 0x00008000 */

/********************  Bit definition for ADC_AWD2CR register  ****************/
#define ADC_AWD2CR_AWD2CH_Pos          (0U)                                    
#define ADC_AWD2CR_AWD2CH_Msk          (0x7FFFFU << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x0007FFFF */
#define ADC_AWD2CR_AWD2CH              ADC_AWD2CR_AWD2CH_Msk                   /*!< ADC analog watchdog 2 monitored channel selection */
#define ADC_AWD2CR_AWD2CH_0            (0x00001U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000001 */
#define ADC_AWD2CR_AWD2CH_1            (0x00002U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000002 */
#define ADC_AWD2CR_AWD2CH_2            (0x00004U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000004 */
#define ADC_AWD2CR_AWD2CH_3            (0x00008U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000008 */
#define ADC_AWD2CR_AWD2CH_4            (0x00010U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000010 */
#define ADC_AWD2CR_AWD2CH_5            (0x00020U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000020 */
#define ADC_AWD2CR_AWD2CH_6            (0x00040U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000040 */
#define ADC_AWD2CR_AWD2CH_7            (0x00080U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000080 */
#define ADC_AWD2CR_AWD2CH_8            (0x00100U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000100 */
#define ADC_AWD2CR_AWD2CH_9            (0x00200U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000200 */
#define ADC_AWD2CR_AWD2CH_10           (0x00400U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000400 */
#define ADC_AWD2CR_AWD2CH_11           (0x00800U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00000800 */
#define ADC_AWD2CR_AWD2CH_12           (0x01000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00001000 */
#define ADC_AWD2CR_AWD2CH_13           (0x02000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00002000 */
#define ADC_AWD2CR_AWD2CH_14           (0x04000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00004000 */
#define ADC_AWD2CR_AWD2CH_15           (0x08000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00008000 */
#define ADC_AWD2CR_AWD2CH_16           (0x10000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00010000 */
#define ADC_AWD2CR_AWD2CH_17           (0x20000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00020000 */
#define ADC_AWD2CR_AWD2CH_18           (0x40000U << ADC_AWD2CR_AWD2CH_Pos)     /*!< 0x00040000 */

/********************  Bit definition for ADC_AWD3CR register  ****************/
#define ADC_AWD3CR_AWD3CH_Pos          (0U)                                    
#define ADC_AWD3CR_AWD3CH_Msk          (0x7FFFFU << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x0007FFFF */
#define ADC_AWD3CR_AWD3CH              ADC_AWD3CR_AWD3CH_Msk                   /*!< ADC analog watchdog 3 monitored channel selection */
#define ADC_AWD3CR_AWD3CH_0            (0x00001U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000001 */
#define ADC_AWD3CR_AWD3CH_1            (0x00002U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000002 */
#define ADC_AWD3CR_AWD3CH_2            (0x00004U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000004 */
#define ADC_AWD3CR_AWD3CH_3            (0x00008U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000008 */
#define ADC_AWD3CR_AWD3CH_4            (0x00010U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000010 */
#define ADC_AWD3CR_AWD3CH_5            (0x00020U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000020 */
#define ADC_AWD3CR_AWD3CH_6            (0x00040U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000040 */
#define ADC_AWD3CR_AWD3CH_7            (0x00080U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000080 */
#define ADC_AWD3CR_AWD3CH_8            (0x00100U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000100 */
#define ADC_AWD3CR_AWD3CH_9            (0x00200U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000200 */
#define ADC_AWD3CR_AWD3CH_10           (0x00400U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000400 */
#define ADC_AWD3CR_AWD3CH_11           (0x00800U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00000800 */
#define ADC_AWD3CR_AWD3CH_12           (0x01000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00001000 */
#define ADC_AWD3CR_AWD3CH_13           (0x02000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00002000 */
#define ADC_AWD3CR_AWD3CH_14           (0x04000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00004000 */
#define ADC_AWD3CR_AWD3CH_15           (0x08000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00008000 */
#define ADC_AWD3CR_AWD3CH_16           (0x10000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00010000 */
#define ADC_AWD3CR_AWD3CH_17           (0x20000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00020000 */
#define ADC_AWD3CR_AWD3CH_18           (0x40000U << ADC_AWD3CR_AWD3CH_Pos)     /*!< 0x00040000 */

/********************  Bit definition for ADC_DIFSEL register  ****************/
#define ADC_DIFSEL_DIFSEL_Pos          (0U)                                    
#define ADC_DIFSEL_DIFSEL_Msk          (0x7FFFFU << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x0007FFFF */
#define ADC_DIFSEL_DIFSEL              ADC_DIFSEL_DIFSEL_Msk                   /*!< ADC channel differential or single-ended mode */
#define ADC_DIFSEL_DIFSEL_0            (0x00001U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000001 */
#define ADC_DIFSEL_DIFSEL_1            (0x00002U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000002 */
#define ADC_DIFSEL_DIFSEL_2            (0x00004U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000004 */
#define ADC_DIFSEL_DIFSEL_3            (0x00008U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000008 */
#define ADC_DIFSEL_DIFSEL_4            (0x00010U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000010 */
#define ADC_DIFSEL_DIFSEL_5            (0x00020U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000020 */
#define ADC_DIFSEL_DIFSEL_6            (0x00040U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000040 */
#define ADC_DIFSEL_DIFSEL_7            (0x00080U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000080 */
#define ADC_DIFSEL_DIFSEL_8            (0x00100U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000100 */
#define ADC_DIFSEL_DIFSEL_9            (0x00200U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000200 */
#define ADC_DIFSEL_DIFSEL_10           (0x00400U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000400 */
#define ADC_DIFSEL_DIFSEL_11           (0x00800U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00000800 */
#define ADC_DIFSEL_DIFSEL_12           (0x01000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00001000 */
#define ADC_DIFSEL_DIFSEL_13           (0x02000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00002000 */
#define ADC_DIFSEL_DIFSEL_14           (0x04000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00004000 */
#define ADC_DIFSEL_DIFSEL_15           (0x08000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00008000 */
#define ADC_DIFSEL_DIFSEL_16           (0x10000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00010000 */
#define ADC_DIFSEL_DIFSEL_17           (0x20000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00020000 */
#define ADC_DIFSEL_DIFSEL_18           (0x40000U << ADC_DIFSEL_DIFSEL_Pos)     /*!< 0x00040000 */

/********************  Bit definition for ADC_CALFACT register  ***************/
#define ADC_CALFACT_CALFACT_S_Pos      (0U)                                    
#define ADC_CALFACT_CALFACT_S_Msk      (0x7FU << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x0000007F */
#define ADC_CALFACT_CALFACT_S          ADC_CALFACT_CALFACT_S_Msk               /*!< ADC calibration factor in single-ended mode */
#define ADC_CALFACT_CALFACT_S_0        (0x01U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000001 */
#define ADC_CALFACT_CALFACT_S_1        (0x02U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000002 */
#define ADC_CALFACT_CALFACT_S_2        (0x04U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000004 */
#define ADC_CALFACT_CALFACT_S_3        (0x08U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000008 */
#define ADC_CALFACT_CALFACT_S_4        (0x10U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000010 */
#define ADC_CALFACT_CALFACT_S_5        (0x20U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000020 */
#define ADC_CALFACT_CALFACT_S_6        (0x40U << ADC_CALFACT_CALFACT_S_Pos)    /*!< 0x00000040 */

#define ADC_CALFACT_CALFACT_D_Pos      (16U)                                   
#define ADC_CALFACT_CALFACT_D_Msk      (0x7FU << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x007F0000 */
#define ADC_CALFACT_CALFACT_D          ADC_CALFACT_CALFACT_D_Msk               /*!< ADC calibration factor in differential mode */
#define ADC_CALFACT_CALFACT_D_0        (0x01U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00010000 */
#define ADC_CALFACT_CALFACT_D_1        (0x02U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00020000 */
#define ADC_CALFACT_CALFACT_D_2        (0x04U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00040000 */
#define ADC_CALFACT_CALFACT_D_3        (0x08U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00080000 */
#define ADC_CALFACT_CALFACT_D_4        (0x10U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00100000 */
#define ADC_CALFACT_CALFACT_D_5        (0x20U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00200000 */
#define ADC_CALFACT_CALFACT_D_6        (0x40U << ADC_CALFACT_CALFACT_D_Pos)    /*!< 0x00400000 */

/*************************  ADC Common registers  *****************************/
/********************  Bit definition for ADC_CSR register  *******************/
#define ADC_CSR_ADRDY_MST_Pos          (0U)                                    
#define ADC_CSR_ADRDY_MST_Msk          (0x1U << ADC_CSR_ADRDY_MST_Pos)         /*!< 0x00000001 */
#define ADC_CSR_ADRDY_MST              ADC_CSR_ADRDY_MST_Msk                   /*!< ADC multimode master ready flag */
#define ADC_CSR_EOSMP_MST_Pos          (1U)                                    
#define ADC_CSR_EOSMP_MST_Msk          (0x1U << ADC_CSR_EOSMP_MST_Pos)         /*!< 0x00000002 */
#define ADC_CSR_EOSMP_MST              ADC_CSR_EOSMP_MST_Msk                   /*!< ADC multimode master group regular end of sampling flag */
#define ADC_CSR_EOC_MST_Pos            (2U)                                    
#define ADC_CSR_EOC_MST_Msk            (0x1U << ADC_CSR_EOC_MST_Pos)           /*!< 0x00000004 */
#define ADC_CSR_EOC_MST                ADC_CSR_EOC_MST_Msk                     /*!< ADC multimode master group regular end of unitary conversion flag */
#define ADC_CSR_EOS_MST_Pos            (3U)                                    
#define ADC_CSR_EOS_MST_Msk            (0x1U << ADC_CSR_EOS_MST_Pos)           /*!< 0x00000008 */
#define ADC_CSR_EOS_MST                ADC_CSR_EOS_MST_Msk                     /*!< ADC multimode master group regular end of sequence conversions flag */
#define ADC_CSR_OVR_MST_Pos            (4U)                                    
#define ADC_CSR_OVR_MST_Msk            (0x1U << ADC_CSR_OVR_MST_Pos)           /*!< 0x00000010 */
#define ADC_CSR_OVR_MST                ADC_CSR_OVR_MST_Msk                     /*!< ADC multimode master group regular overrun flag */
#define ADC_CSR_JEOC_MST_Pos           (5U)                                    
#define ADC_CSR_JEOC_MST_Msk           (0x1U << ADC_CSR_JEOC_MST_Pos)          /*!< 0x00000020 */
#define ADC_CSR_JEOC_MST               ADC_CSR_JEOC_MST_Msk                    /*!< ADC multimode master group injected end of unitary conversion flag */
#define ADC_CSR_JEOS_MST_Pos           (6U)                                    
#define ADC_CSR_JEOS_MST_Msk           (0x1U << ADC_CSR_JEOS_MST_Pos)          /*!< 0x00000040 */
#define ADC_CSR_JEOS_MST               ADC_CSR_JEOS_MST_Msk                    /*!< ADC multimode master group injected end of sequence conversions flag */
#define ADC_CSR_AWD1_MST_Pos           (7U)                                    
#define ADC_CSR_AWD1_MST_Msk           (0x1U << ADC_CSR_AWD1_MST_Pos)          /*!< 0x00000080 */
#define ADC_CSR_AWD1_MST               ADC_CSR_AWD1_MST_Msk                    /*!< ADC multimode master analog watchdog 1 flag */
#define ADC_CSR_AWD2_MST_Pos           (8U)                                    
#define ADC_CSR_AWD2_MST_Msk           (0x1U << ADC_CSR_AWD2_MST_Pos)          /*!< 0x00000100 */
#define ADC_CSR_AWD2_MST               ADC_CSR_AWD2_MST_Msk                    /*!< ADC multimode master analog watchdog 2 flag */
#define ADC_CSR_AWD3_MST_Pos           (9U)                                    
#define ADC_CSR_AWD3_MST_Msk           (0x1U << ADC_CSR_AWD3_MST_Pos)          /*!< 0x00000200 */
#define ADC_CSR_AWD3_MST               ADC_CSR_AWD3_MST_Msk                    /*!< ADC multimode master analog watchdog 3 flag */
#define ADC_CSR_JQOVF_MST_Pos          (10U)                                   
#define ADC_CSR_JQOVF_MST_Msk          (0x1U << ADC_CSR_JQOVF_MST_Pos)         /*!< 0x00000400 */
#define ADC_CSR_JQOVF_MST              ADC_CSR_JQOVF_MST_Msk                   /*!< ADC multimode master group injected contexts queue overflow flag */

#define ADC_CSR_ADRDY_SLV_Pos          (16U)                                   
#define ADC_CSR_ADRDY_SLV_Msk          (0x1U << ADC_CSR_ADRDY_SLV_Pos)         /*!< 0x00010000 */
#define ADC_CSR_ADRDY_SLV              ADC_CSR_ADRDY_SLV_Msk                   /*!< ADC multimode slave ready flag */
#define ADC_CSR_EOSMP_SLV_Pos          (17U)                                   
#define ADC_CSR_EOSMP_SLV_Msk          (0x1U << ADC_CSR_EOSMP_SLV_Pos)         /*!< 0x00020000 */
#define ADC_CSR_EOSMP_SLV              ADC_CSR_EOSMP_SLV_Msk                   /*!< ADC multimode slave group regular end of sampling flag */
#define ADC_CSR_EOC_SLV_Pos            (18U)                                   
#define ADC_CSR_EOC_SLV_Msk            (0x1U << ADC_CSR_EOC_SLV_Pos)           /*!< 0x00040000 */
#define ADC_CSR_EOC_SLV                ADC_CSR_EOC_SLV_Msk                     /*!< ADC multimode slave group regular end of unitary conversion flag */
#define ADC_CSR_EOS_SLV_Pos            (19U)                                   
#define ADC_CSR_EOS_SLV_Msk            (0x1U << ADC_CSR_EOS_SLV_Pos)           /*!< 0x00080000 */
#define ADC_CSR_EOS_SLV                ADC_CSR_EOS_SLV_Msk                     /*!< ADC multimode slave group regular end of sequence conversions flag */
#define ADC_CSR_OVR_SLV_Pos            (20U)                                   
#define ADC_CSR_OVR_SLV_Msk            (0x1U << ADC_CSR_OVR_SLV_Pos)           /*!< 0x00100000 */
#define ADC_CSR_OVR_SLV                ADC_CSR_OVR_SLV_Msk                     /*!< ADC multimode slave group regular overrun flag */
#define ADC_CSR_JEOC_SLV_Pos           (21U)                                   
#define ADC_CSR_JEOC_SLV_Msk           (0x1U << ADC_CSR_JEOC_SLV_Pos)          /*!< 0x00200000 */
#define ADC_CSR_JEOC_SLV               ADC_CSR_JEOC_SLV_Msk                    /*!< ADC multimode slave group injected end of unitary conversion flag */
#define ADC_CSR_JEOS_SLV_Pos           (22U)                                   
#define ADC_CSR_JEOS_SLV_Msk           (0x1U << ADC_CSR_JEOS_SLV_Pos)          /*!< 0x00400000 */
#define ADC_CSR_JEOS_SLV               ADC_CSR_JEOS_SLV_Msk                    /*!< ADC multimode slave group injected end of sequence conversions flag */
#define ADC_CSR_AWD1_SLV_Pos           (23U)                                   
#define ADC_CSR_AWD1_SLV_Msk           (0x1U << ADC_CSR_AWD1_SLV_Pos)          /*!< 0x00800000 */
#define ADC_CSR_AWD1_SLV               ADC_CSR_AWD1_SLV_Msk                    /*!< ADC multimode slave analog watchdog 1 flag */
#define ADC_CSR_AWD2_SLV_Pos           (24U)                                   
#define ADC_CSR_AWD2_SLV_Msk           (0x1U << ADC_CSR_AWD2_SLV_Pos)          /*!< 0x01000000 */
#define ADC_CSR_AWD2_SLV               ADC_CSR_AWD2_SLV_Msk                    /*!< ADC multimode slave analog watchdog 2 flag */
#define ADC_CSR_AWD3_SLV_Pos           (25U)                                   
#define ADC_CSR_AWD3_SLV_Msk           (0x1U << ADC_CSR_AWD3_SLV_Pos)          /*!< 0x02000000 */
#define ADC_CSR_AWD3_SLV               ADC_CSR_AWD3_SLV_Msk                    /*!< ADC multimode slave analog watchdog 3 flag */
#define ADC_CSR_JQOVF_SLV_Pos          (26U)                                   
#define ADC_CSR_JQOVF_SLV_Msk          (0x1U << ADC_CSR_JQOVF_SLV_Pos)         /*!< 0x04000000 */
#define ADC_CSR_JQOVF_SLV              ADC_CSR_JQOVF_SLV_Msk                   /*!< ADC multimode slave group injected contexts queue overflow flag */

/********************  Bit definition for ADC_CCR register  *******************/
#define ADC_CCR_DUAL_Pos               (0U)                                    
#define ADC_CCR_DUAL_Msk               (0x1FU << ADC_CCR_DUAL_Pos)             /*!< 0x0000001F */
#define ADC_CCR_DUAL                   ADC_CCR_DUAL_Msk                        /*!< ADC multimode mode selection */
#define ADC_CCR_DUAL_0                 (0x01U << ADC_CCR_DUAL_Pos)             /*!< 0x00000001 */
#define ADC_CCR_DUAL_1                 (0x02U << ADC_CCR_DUAL_Pos)             /*!< 0x00000002 */
#define ADC_CCR_DUAL_2                 (0x04U << ADC_CCR_DUAL_Pos)             /*!< 0x00000004 */
#define ADC_CCR_DUAL_3                 (0x08U << ADC_CCR_DUAL_Pos)             /*!< 0x00000008 */
#define ADC_CCR_DUAL_4                 (0x10U << ADC_CCR_DUAL_Pos)             /*!< 0x00000010 */

#define ADC_CCR_DELAY_Pos              (8U)                                    
#define ADC_CCR_DELAY_Msk              (0xFU << ADC_CCR_DELAY_Pos)             /*!< 0x00000F00 */
#define ADC_CCR_DELAY                  ADC_CCR_DELAY_Msk                       /*!< ADC multimode delay between 2 sampling phases */
#define ADC_CCR_DELAY_0                (0x1U << ADC_CCR_DELAY_Pos)             /*!< 0x00000100 */
#define ADC_CCR_DELAY_1                (0x2U << ADC_CCR_DELAY_Pos)             /*!< 0x00000200 */
#define ADC_CCR_DELAY_2                (0x4U << ADC_CCR_DELAY_Pos)             /*!< 0x00000400 */
#define ADC_CCR_DELAY_3                (0x8U << ADC_CCR_DELAY_Pos)             /*!< 0x00000800 */

#define ADC_CCR_DMACFG_Pos             (13U)                                   
#define ADC_CCR_DMACFG_Msk             (0x1U << ADC_CCR_DMACFG_Pos)            /*!< 0x00002000 */
#define ADC_CCR_DMACFG                 ADC_CCR_DMACFG_Msk                      /*!< ADC multimode DMA transfer configuration */

#define ADC_CCR_MDMA_Pos               (14U)                                   
#define ADC_CCR_MDMA_Msk               (0x3U << ADC_CCR_MDMA_Pos)              /*!< 0x0000C000 */
#define ADC_CCR_MDMA                   ADC_CCR_MDMA_Msk                        /*!< ADC multimode DMA transfer enable */
#define ADC_CCR_MDMA_0                 (0x1U << ADC_CCR_MDMA_Pos)              /*!< 0x00004000 */
#define ADC_CCR_MDMA_1                 (0x2U << ADC_CCR_MDMA_Pos)              /*!< 0x00008000 */

#define ADC_CCR_CKMODE_Pos             (16U)                                   
#define ADC_CCR_CKMODE_Msk             (0x3U << ADC_CCR_CKMODE_Pos)            /*!< 0x00030000 */
#define ADC_CCR_CKMODE                 ADC_CCR_CKMODE_Msk                      /*!< ADC common clock source and prescaler (prescaler only for clock source synchronous) */
#define ADC_CCR_CKMODE_0               (0x1U << ADC_CCR_CKMODE_Pos)            /*!< 0x00010000 */
#define ADC_CCR_CKMODE_1               (0x2U << ADC_CCR_CKMODE_Pos)            /*!< 0x00020000 */

#define ADC_CCR_PRESC_Pos              (18U)                                   
#define ADC_CCR_PRESC_Msk              (0xFU << ADC_CCR_PRESC_Pos)             /*!< 0x003C0000 */
#define ADC_CCR_PRESC                  ADC_CCR_PRESC_Msk                       /*!< ADC common clock prescaler, only for clock source asynchronous */
#define ADC_CCR_PRESC_0                (0x1U << ADC_CCR_PRESC_Pos)             /*!< 0x00040000 */
#define ADC_CCR_PRESC_1                (0x2U << ADC_CCR_PRESC_Pos)             /*!< 0x00080000 */
#define ADC_CCR_PRESC_2                (0x4U << ADC_CCR_PRESC_Pos)             /*!< 0x00100000 */
#define ADC_CCR_PRESC_3                (0x8U << ADC_CCR_PRESC_Pos)             /*!< 0x00200000 */

#define ADC_CCR_VREFEN_Pos             (22U)                                   
#define ADC_CCR_VREFEN_Msk             (0x1U << ADC_CCR_VREFEN_Pos)            /*!< 0x00400000 */
#define ADC_CCR_VREFEN                 ADC_CCR_VREFEN_Msk                      /*!< ADC internal path to VrefInt enable */
#define ADC_CCR_TSEN_Pos               (23U)                                   
#define ADC_CCR_TSEN_Msk               (0x1U << ADC_CCR_TSEN_Pos)              /*!< 0x00800000 */
#define ADC_CCR_TSEN                   ADC_CCR_TSEN_Msk                        /*!< ADC internal path to temperature sensor enable */
#define ADC_CCR_VBATEN_Pos             (24U)                                   
#define ADC_CCR_VBATEN_Msk             (0x1U << ADC_CCR_VBATEN_Pos)            /*!< 0x01000000 */
#define ADC_CCR_VBATEN                 ADC_CCR_VBATEN_Msk                      /*!< ADC internal path to battery voltage enable */

/********************  Bit definition for ADC_CDR register  *******************/
#define ADC_CDR_RDATA_MST_Pos          (0U)                                    
#define ADC_CDR_RDATA_MST_Msk          (0xFFFFU << ADC_CDR_RDATA_MST_Pos)      /*!< 0x0000FFFF */
#define ADC_CDR_RDATA_MST              ADC_CDR_RDATA_MST_Msk                   /*!< ADC multimode master group regular conversion data */
#define ADC_CDR_RDATA_MST_0            (0x0001U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000001 */
#define ADC_CDR_RDATA_MST_1            (0x0002U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000002 */
#define ADC_CDR_RDATA_MST_2            (0x0004U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000004 */
#define ADC_CDR_RDATA_MST_3            (0x0008U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000008 */
#define ADC_CDR_RDATA_MST_4            (0x0010U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000010 */
#define ADC_CDR_RDATA_MST_5            (0x0020U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000020 */
#define ADC_CDR_RDATA_MST_6            (0x0040U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000040 */
#define ADC_CDR_RDATA_MST_7            (0x0080U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000080 */
#define ADC_CDR_RDATA_MST_8            (0x0100U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000100 */
#define ADC_CDR_RDATA_MST_9            (0x0200U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000200 */
#define ADC_CDR_RDATA_MST_10           (0x0400U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000400 */
#define ADC_CDR_RDATA_MST_11           (0x0800U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00000800 */
#define ADC_CDR_RDATA_MST_12           (0x1000U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00001000 */
#define ADC_CDR_RDATA_MST_13           (0x2000U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00002000 */
#define ADC_CDR_RDATA_MST_14           (0x4000U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00004000 */
#define ADC_CDR_RDATA_MST_15           (0x8000U << ADC_CDR_RDATA_MST_Pos)      /*!< 0x00008000 */

#define ADC_CDR_RDATA_SLV_Pos          (16U)                                   
#define ADC_CDR_RDATA_SLV_Msk          (0xFFFFU << ADC_CDR_RDATA_SLV_Pos)      /*!< 0xFFFF0000 */
#define ADC_CDR_RDATA_SLV              ADC_CDR_RDATA_SLV_Msk                   /*!< ADC multimode slave group regular conversion data */
#define ADC_CDR_RDATA_SLV_0            (0x0001U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00010000 */
#define ADC_CDR_RDATA_SLV_1            (0x0002U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00020000 */
#define ADC_CDR_RDATA_SLV_2            (0x0004U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00040000 */
#define ADC_CDR_RDATA_SLV_3            (0x0008U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00080000 */
#define ADC_CDR_RDATA_SLV_4            (0x0010U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00100000 */
#define ADC_CDR_RDATA_SLV_5            (0x0020U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00200000 */
#define ADC_CDR_RDATA_SLV_6            (0x0040U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00400000 */
#define ADC_CDR_RDATA_SLV_7            (0x0080U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x00800000 */
#define ADC_CDR_RDATA_SLV_8            (0x0100U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x01000000 */
#define ADC_CDR_RDATA_SLV_9            (0x0200U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x02000000 */
#define ADC_CDR_RDATA_SLV_10           (0x0400U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x04000000 */
#define ADC_CDR_RDATA_SLV_11           (0x0800U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x08000000 */
#define ADC_CDR_RDATA_SLV_12           (0x1000U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x10000000 */
#define ADC_CDR_RDATA_SLV_13           (0x2000U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x20000000 */
#define ADC_CDR_RDATA_SLV_14           (0x4000U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x40000000 */
#define ADC_CDR_RDATA_SLV_15           (0x8000U << ADC_CDR_RDATA_SLV_Pos)      /*!< 0x80000000 */

/******************************************************************************/

/******************************************************************************/
/*                                                                            */
/*                                    TIM                                     */
/*                                                                            */
/******************************************************************************/
/*******************  Bit definition for TIM_CR1 register  ********************/
#define TIM_CR1_CEN_Pos           (0U)                                         
#define TIM_CR1_CEN_Msk           (0x1U << TIM_CR1_CEN_Pos)                    /*!< 0x00000001 */
#define TIM_CR1_CEN               TIM_CR1_CEN_Msk                              /*!<Counter enable */
#define TIM_CR1_UDIS_Pos          (1U)                                         
#define TIM_CR1_UDIS_Msk          (0x1U << TIM_CR1_UDIS_Pos)                   /*!< 0x00000002 */
#define TIM_CR1_UDIS              TIM_CR1_UDIS_Msk                             /*!<Update disable */
#define TIM_CR1_URS_Pos           (2U)                                         
#define TIM_CR1_URS_Msk           (0x1U << TIM_CR1_URS_Pos)                    /*!< 0x00000004 */
#define TIM_CR1_URS               TIM_CR1_URS_Msk                              /*!<Update request source */
#define TIM_CR1_OPM_Pos           (3U)                                         
#define TIM_CR1_OPM_Msk           (0x1U << TIM_CR1_OPM_Pos)                    /*!< 0x00000008 */
#define TIM_CR1_OPM               TIM_CR1_OPM_Msk                              /*!<One pulse mode */
#define TIM_CR1_DIR_Pos           (4U)                                         
#define TIM_CR1_DIR_Msk           (0x1U << TIM_CR1_DIR_Pos)                    /*!< 0x00000010 */
#define TIM_CR1_DIR               TIM_CR1_DIR_Msk                              /*!<Direction */

#define TIM_CR1_CMS_Pos           (5U)                                         
#define TIM_CR1_CMS_Msk           (0x3U << TIM_CR1_CMS_Pos)                    /*!< 0x00000060 */
#define TIM_CR1_CMS               TIM_CR1_CMS_Msk                              /*!<CMS[1:0] bits (Center-aligned mode selection) */
#define TIM_CR1_CMS_0             (0x1U << TIM_CR1_CMS_Pos)                    /*!< 0x00000020 */
#define TIM_CR1_CMS_1             (0x2U << TIM_CR1_CMS_Pos)                    /*!< 0x00000040 */

#define TIM_CR1_ARPE_Pos          (7U)                                         
#define TIM_CR1_ARPE_Msk          (0x1U << TIM_CR1_ARPE_Pos)                   /*!< 0x00000080 */
#define TIM_CR1_ARPE              TIM_CR1_ARPE_Msk                             /*!<Auto-reload preload enable */

#define TIM_CR1_CKD_Pos           (8U)                                         
#define TIM_CR1_CKD_Msk           (0x3U << TIM_CR1_CKD_Pos)                    /*!< 0x00000300 */
#define TIM_CR1_CKD               TIM_CR1_CKD_Msk                              /*!<CKD[1:0] bits (clock division) */
#define TIM_CR1_CKD_0             (0x1U << TIM_CR1_CKD_Pos)                    /*!< 0x00000100 */
#define TIM_CR1_CKD_1             (0x2U << TIM_CR1_CKD_Pos)                    /*!< 0x00000200 */

#define TIM_CR1_UIFREMAP_Pos      (11U)                                        
#define TIM_CR1_UIFREMAP_Msk      (0x1U << TIM_CR1_UIFREMAP_Pos)               /*!< 0x00000800 */
#define TIM_CR1_UIFREMAP          TIM_CR1_UIFREMAP_Msk                         /*!<Update interrupt flag remap */

/*******************  Bit definition for TIM_CR2 register  ********************/
#define TIM_CR2_CCPC_Pos          (0U)                                         
#define TIM_CR2_CCPC_Msk          (0x1U << TIM_CR2_CCPC_Pos)                   /*!< 0x00000001 */
#define TIM_CR2_CCPC              TIM_CR2_CCPC_Msk                             /*!<Capture/Compare Preloaded Control */
#define TIM_CR2_CCUS_Pos          (2U)                                         
#define TIM_CR2_CCUS_Msk          (0x1U << TIM_CR2_CCUS_Pos)                   /*!< 0x00000004 */
#define TIM_CR2_CCUS              TIM_CR2_CCUS_Msk                             /*!<Capture/Compare Control Update Selection */
#define TIM_CR2_CCDS_Pos          (3U)                                         
#define TIM_CR2_CCDS_Msk          (0x1U << TIM_CR2_CCDS_Pos)                   /*!< 0x00000008 */
#define TIM_CR2_CCDS              TIM_CR2_CCDS_Msk                             /*!<Capture/Compare DMA Selection */

#define TIM_CR2_MMS_Pos           (4U)                                         
#define TIM_CR2_MMS_Msk           (0x7U << TIM_CR2_MMS_Pos)                    /*!< 0x00000070 */
#define TIM_CR2_MMS               TIM_CR2_MMS_Msk                              /*!<MMS[2:0] bits (Master Mode Selection) */
#define TIM_CR2_MMS_0             (0x1U << TIM_CR2_MMS_Pos)                    /*!< 0x00000010 */
#define TIM_CR2_MMS_1             (0x2U << TIM_CR2_MMS_Pos)                    /*!< 0x00000020 */
#define TIM_CR2_MMS_2             (0x4U << TIM_CR2_MMS_Pos)                    /*!< 0x00000040 */

#define TIM_CR2_TI1S_Pos          (7U)                                         
#define TIM_CR2_TI1S_Msk          (0x1U << TIM_CR2_TI1S_Pos)                   /*!< 0x00000080 */
#define TIM_CR2_TI1S              TIM_CR2_TI1S_Msk                             /*!<TI1 Selection */
#define TIM_CR2_OIS1_Pos          (8U)                                         
#define TIM_CR2_OIS1_Msk          (0x1U << TIM_CR2_OIS1_Pos)                   /*!< 0x00000100 */
#define TIM_CR2_OIS1              TIM_CR2_OIS1_Msk                             /*!<Output Idle state 1 (OC1 output) */
#define TIM_CR2_OIS1N_Pos         (9U)                                         
#define TIM_CR2_OIS1N_Msk         (0x1U << TIM_CR2_OIS1N_Pos)                  /*!< 0x00000200 */
#define TIM_CR2_OIS1N             TIM_CR2_OIS1N_Msk                            /*!<Output Idle state 1 (OC1N output) */
#define TIM_CR2_OIS2_Pos          (10U)                                        
#define TIM_CR2_OIS2_Msk          (0x1U << TIM_CR2_OIS2_Pos)                   /*!< 0x00000400 */
#define TIM_CR2_OIS2              TIM_CR2_OIS2_Msk                             /*!<Output Idle state 2 (OC2 output) */
#define TIM_CR2_OIS2N_Pos         (11U)                                        
#define TIM_CR2_OIS2N_Msk         (0x1U << TIM_CR2_OIS2N_Pos)                  /*!< 0x00000800 */
#define TIM_CR2_OIS2N             TIM_CR2_OIS2N_Msk                            /*!<Output Idle state 2 (OC2N output) */
#define TIM_CR2_OIS3_Pos          (12U)                                        
#define TIM_CR2_OIS3_Msk          (0x1U << TIM_CR2_OIS3_Pos)                   /*!< 0x00001000 */
#define TIM_CR2_OIS3              TIM_CR2_OIS3_Msk                             /*!<Output Idle state 3 (OC3 output) */
#define TIM_CR2_OIS3N_Pos         (13U)                                        
#define TIM_CR2_OIS3N_Msk         (0x1U << TIM_CR2_OIS3N_Pos)                  /*!< 0x00002000 */
#define TIM_CR2_OIS3N             TIM_CR2_OIS3N_Msk                            /*!<Output Idle state 3 (OC3N output) */
#define TIM_CR2_OIS4_Pos          (14U)                                        
#define TIM_CR2_OIS4_Msk          (0x1U << TIM_CR2_OIS4_Pos)                   /*!< 0x00004000 */
#define TIM_CR2_OIS4              TIM_CR2_OIS4_Msk                             /*!<Output Idle state 4 (OC4 output) */
#define TIM_CR2_OIS5_Pos          (16U)                                        
#define TIM_CR2_OIS5_Msk          (0x1U << TIM_CR2_OIS5_Pos)                   /*!< 0x00010000 */
#define TIM_CR2_OIS5              TIM_CR2_OIS5_Msk                             /*!<Output Idle state 5 (OC5 output) */
#define TIM_CR2_OIS6_Pos          (18U)                                        
#define TIM_CR2_OIS6_Msk          (0x1U << TIM_CR2_OIS6_Pos)                   /*!< 0x00040000 */
#define TIM_CR2_OIS6              TIM_CR2_OIS6_Msk                             /*!<Output Idle state 6 (OC6 output) */

#define TIM_CR2_MMS2_Pos          (20U)                                        
#define TIM_CR2_MMS2_Msk          (0xFU << TIM_CR2_MMS2_Pos)                   /*!< 0x00F00000 */
#define TIM_CR2_MMS2              TIM_CR2_MMS2_Msk                             /*!<MMS[2:0] bits (Master Mode Selection) */
#define TIM_CR2_MMS2_0            (0x1U << TIM_CR2_MMS2_Pos)                   /*!< 0x00100000 */
#define TIM_CR2_MMS2_1            (0x2U << TIM_CR2_MMS2_Pos)                   /*!< 0x00200000 */
#define TIM_CR2_MMS2_2            (0x4U << TIM_CR2_MMS2_Pos)                   /*!< 0x00400000 */
#define TIM_CR2_MMS2_3            (0x8U << TIM_CR2_MMS2_Pos)                   /*!< 0x00800000 */

/*******************  Bit definition for TIM_SMCR register  *******************/
#define TIM_SMCR_SMS_Pos          (0U)                                         
#define TIM_SMCR_SMS_Msk          (0x10007U << TIM_SMCR_SMS_Pos)               /*!< 0x00010007 */
#define TIM_SMCR_SMS              TIM_SMCR_SMS_Msk                             /*!<SMS[2:0] bits (Slave mode selection) */
#define TIM_SMCR_SMS_0            (0x00001U << TIM_SMCR_SMS_Pos)               /*!< 0x00000001 */
#define TIM_SMCR_SMS_1            (0x00002U << TIM_SMCR_SMS_Pos)               /*!< 0x00000002 */
#define TIM_SMCR_SMS_2            (0x00004U << TIM_SMCR_SMS_Pos)               /*!< 0x00000004 */
#define TIM_SMCR_SMS_3            (0x10000U << TIM_SMCR_SMS_Pos)               /*!< 0x00010000 */

#define TIM_SMCR_OCCS_Pos         (3U)                                         
#define TIM_SMCR_OCCS_Msk         (0x1U << TIM_SMCR_OCCS_Pos)                  /*!< 0x00000008 */
#define TIM_SMCR_OCCS             TIM_SMCR_OCCS_Msk                            /*!< OCREF clear selection */

#define TIM_SMCR_TS_Pos           (4U)                                         
#define TIM_SMCR_TS_Msk           (0x7U << TIM_SMCR_TS_Pos)                    /*!< 0x00000070 */
#define TIM_SMCR_TS               TIM_SMCR_TS_Msk                              /*!<TS[2:0] bits (Trigger selection) */
#define TIM_SMCR_TS_0             (0x1U << TIM_SMCR_TS_Pos)                    /*!< 0x00000010 */
#define TIM_SMCR_TS_1             (0x2U << TIM_SMCR_TS_Pos)                    /*!< 0x00000020 */
#define TIM_SMCR_TS_2             (0x4U << TIM_SMCR_TS_Pos)                    /*!< 0x00000040 */

#define TIM_SMCR_MSM_Pos          (7U)                                         
#define TIM_SMCR_MSM_Msk          (0x1U << TIM_SMCR_MSM_Pos)                   /*!< 0x00000080 */
#define TIM_SMCR_MSM              TIM_SMCR_MSM_Msk                             /*!<Master/slave mode */

#define TIM_SMCR_ETF_Pos          (8U)                                         
#define TIM_SMCR_ETF_Msk          (0xFU << TIM_SMCR_ETF_Pos)                   /*!< 0x00000F00 */
#define TIM_SMCR_ETF              TIM_SMCR_ETF_Msk                             /*!<ETF[3:0] bits (External trigger filter) */
#define TIM_SMCR_ETF_0            (0x1U << TIM_SMCR_ETF_Pos)                   /*!< 0x00000100 */
#define TIM_SMCR_ETF_1            (0x2U << TIM_SMCR_ETF_Pos)                   /*!< 0x00000200 */
#define TIM_SMCR_ETF_2            (0x4U << TIM_SMCR_ETF_Pos)                   /*!< 0x00000400 */
#define TIM_SMCR_ETF_3            (0x8U << TIM_SMCR_ETF_Pos)                   /*!< 0x00000800 */

#define TIM_SMCR_ETPS_Pos         (12U)                                        
#define TIM_SMCR_ETPS_Msk         (0x3U << TIM_SMCR_ETPS_Pos)                  /*!< 0x00003000 */
#define TIM_SMCR_ETPS             TIM_SMCR_ETPS_Msk                            /*!<ETPS[1:0] bits (External trigger prescaler) */
#define TIM_SMCR_ETPS_0           (0x1U << TIM_SMCR_ETPS_Pos)                  /*!< 0x00001000 */
#define TIM_SMCR_ETPS_1           (0x2U << TIM_SMCR_ETPS_Pos)                  /*!< 0x00002000 */

#define TIM_SMCR_ECE_Pos          (14U)                                        
#define TIM_SMCR_ECE_Msk          (0x1U << TIM_SMCR_ECE_Pos)                   /*!< 0x00004000 */
#define TIM_SMCR_ECE              TIM_SMCR_ECE_Msk                             /*!<External clock enable */
#define TIM_SMCR_ETP_Pos          (15U)                                        
#define TIM_SMCR_ETP_Msk          (0x1U << TIM_SMCR_ETP_Pos)                   /*!< 0x00008000 */
#define TIM_SMCR_ETP              TIM_SMCR_ETP_Msk                             /*!<External trigger polarity */

/*******************  Bit definition for TIM_DIER register  *******************/
#define TIM_DIER_UIE_Pos          (0U)                                         
#define TIM_DIER_UIE_Msk          (0x1U << TIM_DIER_UIE_Pos)                   /*!< 0x00000001 */
#define TIM_DIER_UIE              TIM_DIER_UIE_Msk                             /*!<Update interrupt enable */
#define TIM_DIER_CC1IE_Pos        (1U)                                         
#define TIM_DIER_CC1IE_Msk        (0x1U << TIM_DIER_CC1IE_Pos)                 /*!< 0x00000002 */
#define TIM_DIER_CC1IE            TIM_DIER_CC1IE_Msk                           /*!<Capture/Compare 1 interrupt enable */
#define TIM_DIER_CC2IE_Pos        (2U)                                         
#define TIM_DIER_CC2IE_Msk        (0x1U << TIM_DIER_CC2IE_Pos)                 /*!< 0x00000004 */
#define TIM_DIER_CC2IE            TIM_DIER_CC2IE_Msk                           /*!<Capture/Compare 2 interrupt enable */
#define TIM_DIER_CC3IE_Pos        (3U)                                         
#define TIM_DIER_CC3IE_Msk        (0x1U << TIM_DIER_CC3IE_Pos)                 /*!< 0x00000008 */
#define TIM_DIER_CC3IE            TIM_DIER_CC3IE_Msk                           /*!<Capture/Compare 3 interrupt enable */
#define TIM_DIER_CC4IE_Pos        (4U)                                         
#define TIM_DIER_CC4IE_Msk        (0x1U << TIM_DIER_CC4IE_Pos)                 /*!< 0x00000010 */
#define TIM_DIER_CC4IE            TIM_DIER_CC4IE_Msk                           /*!<Capture/Compare 4 interrupt enable */
#define TIM_DIER_COMIE_Pos        (5U)                                         
#define TIM_DIER_COMIE_Msk        (0x1U << TIM_DIER_COMIE_Pos)                 /*!< 0x00000020 */
#define TIM_DIER_COMIE            TIM_DIER_COMIE_Msk                           /*!<COM interrupt enable */
#define TIM_DIER_TIE_Pos          (6U)                                         
#define TIM_DIER_TIE_Msk          (0x1U << TIM_DIER_TIE_Pos)                   /*!< 0x00000040 */
#define TIM_DIER_TIE              TIM_DIER_TIE_Msk                             /*!<Trigger interrupt enable */
#define TIM_DIER_BIE_Pos          (7U)                                         
#define TIM_DIER_BIE_Msk          (0x1U << TIM_DIER_BIE_Pos)                   /*!< 0x00000080 */
#define TIM_DIER_BIE              TIM_DIER_BIE_Msk                             /*!<Break interrupt enable */
#define TIM_DIER_UDE_Pos          (8U)                                         
#define TIM_DIER_UDE_Msk          (0x1U << TIM_DIER_UDE_Pos)                   /*!< 0x00000100 */
#define TIM_DIER_UDE              TIM_DIER_UDE_Msk                             /*!<Update DMA request enable */
#define TIM_DIER_CC1DE_Pos        (9U)                                         
#define TIM_DIER_CC1DE_Msk        (0x1U << TIM_DIER_CC1DE_Pos)                 /*!< 0x00000200 */
#define TIM_DIER_CC1DE            TIM_DIER_CC1DE_Msk                           /*!<Capture/Compare 1 DMA request enable */
#define TIM_DIER_CC2DE_Pos        (10U)                                        
#define TIM_DIER_CC2DE_Msk        (0x1U << TIM_DIER_CC2DE_Pos)                 /*!< 0x00000400 */
#define TIM_DIER_CC2DE            TIM_DIER_CC2DE_Msk                           /*!<Capture/Compare 2 DMA request enable */
#define TIM_DIER_CC3DE_Pos        (11U)                                        
#define TIM_DIER_CC3DE_Msk        (0x1U << TIM_DIER_CC3DE_Pos)                 /*!< 0x00000800 */
#define TIM_DIER_CC3DE            TIM_DIER_CC3DE_Msk                           /*!<Capture/Compare 3 DMA request enable */
#define TIM_DIER_CC4DE_Pos        (12U)                                        
#define TIM_DIER_CC4DE_Msk        (0x1U << TIM_DIER_CC4DE_Pos)                 /*!< 0x00001000 */
#define TIM_DIER_CC4DE            TIM_DIER_CC4DE_Msk                           /*!<Capture/Compare 4 DMA request enable */
#define TIM_DIER_COMDE_Pos        (13U)                                        
#define TIM_DIER_COMDE_Msk        (0x1U << TIM_DIER_COMDE_Pos)                 /*!< 0x00002000 */
#define TIM_DIER_COMDE            TIM_DIER_COMDE_Msk                           /*!<COM DMA request enable */
#define TIM_DIER_TDE_Pos          (14U)                                        
#define TIM_DIER_TDE_Msk          (0x1U << TIM_DIER_TDE_Pos)                   /*!< 0x00004000 */
#define TIM_DIER_TDE              TIM_DIER_TDE_Msk                             /*!<Trigger DMA request enable */

/********************  Bit definition for TIM_SR register  ********************/
#define TIM_SR_UIF_Pos            (0U)                                         
#define TIM_SR_UIF_Msk            (0x1U << TIM_SR_UIF_Pos)                     /*!< 0x00000001 */
#define TIM_SR_UIF                TIM_SR_UIF_Msk                               /*!<Update interrupt Flag */
#define TIM_SR_CC1IF_Pos          (1U)                                         
#define TIM_SR_CC1IF_Msk          (0x1U << TIM_SR_CC1IF_Pos)                   /*!< 0x00000002 */
#define TIM_SR_CC1IF              TIM_SR_CC1IF_Msk                             /*!<Capture/Compare 1 interrupt Flag */
#define TIM_SR_CC2IF_Pos          (2U)                                         
#define TIM_SR_CC2IF_Msk          (0x1U << TIM_SR_CC2IF_Pos)                   /*!< 0x00000004 */
#define TIM_SR_CC2IF              TIM_SR_CC2IF_Msk                             /*!<Capture/Compare 2 interrupt Flag */
#define TIM_SR_CC3IF_Pos          (3U)                                         
#define TIM_SR_CC3IF_Msk          (0x1U << TIM_SR_CC3IF_Pos)                   /*!< 0x00000008 */
#define TIM_SR_CC3IF              TIM_SR_CC3IF_Msk                             /*!<Capture/Compare 3 interrupt Flag */
#define TIM_SR_CC4IF_Pos          (4U)                                         
#define TIM_SR_CC4IF_Msk          (0x1U << TIM_SR_CC4IF_Pos)                   /*!< 0x00000010 */
#define TIM_SR_CC4IF              TIM_SR_CC4IF_Msk                             /*!<Capture/Compare 4 interrupt Flag */
#define TIM_SR_COMIF_Pos          (5U)                                         
#define TIM_SR_COMIF_Msk          (0x1U << TIM_SR_COMIF_Pos)                   /*!< 0x00000020 */
#define TIM_SR_COMIF              TIM_SR_COMIF_Msk                             /*!<COM interrupt Flag */
#define TIM_SR_TIF_Pos            (6U)                                         
#define TIM_SR_TIF_Msk            (0x1U << TIM_SR_TIF_Pos)                     /*!< 0x00000040 */
#define TIM_SR_TIF                TIM_SR_TIF_Msk                               /*!<Trigger interrupt Flag */
#define TIM_SR_BIF_Pos            (7U)                                         
#define TIM_SR_BIF_Msk            (0x1U << TIM_SR_BIF_Pos)                     /*!< 0x00000080 */
#define TIM_SR_BIF                TIM_SR_BIF_Msk                               /*!<Break interrupt Flag */
#define TIM_SR_B2IF_Pos           (8U)                                         
#define TIM_SR_B2IF_Msk           (0x1U << TIM_SR_B2IF_Pos)                    /*!< 0x00000100 */
#define TIM_SR_B2IF               TIM_SR_B2IF_Msk                              /*!<Break 2 interrupt Flag */
#define TIM_SR_CC1OF_Pos          (9U)                                         
#define TIM_SR_CC1OF_Msk          (0x1U << TIM_SR_CC1OF_Pos)                   /*!< 0x00000200 */
#define TIM_SR_CC1OF              TIM_SR_CC1OF_Msk                             /*!<Capture/Compare 1 Overcapture Flag */
#define TIM_SR_CC2OF_Pos          (10U)                                        
#define TIM_SR_CC2OF_Msk          (0x1U << TIM_SR_CC2OF_Pos)                   /*!< 0x00000400 */
#define TIM_SR_CC2OF              TIM_SR_CC2OF_Msk                             /*!<Capture/Compare 2 Overcapture Flag */
#define TIM_SR_CC3OF_Pos          (11U)                                        
#define TIM_SR_CC3OF_Msk          (0x1U << TIM_SR_CC3OF_Pos)                   /*!< 0x00000800 */
#define TIM_SR_CC3OF              TIM_SR_CC3OF_Msk                             /*!<Capture/Compare 3 Overcapture Flag */
#define TIM_SR_CC4OF_Pos          (12U)                                        
#define TIM_SR_CC4OF_Msk          (0x1U << TIM_SR_CC4OF_Pos)                   /*!< 0x00001000 */
#define TIM_SR_CC4OF              TIM_SR_CC4OF_Msk                             /*!<Capture/Compare 4 Overcapture Flag */
#define TIM_SR_SBIF_Pos           (13U)                                        
#define TIM_SR_SBIF_Msk           (0x1U << TIM_SR_SBIF_Pos)                    /*!< 0x00002000 */
#define TIM_SR_SBIF               TIM_SR_SBIF_Msk                              /*!<System Break interrupt Flag */
#define TIM_SR_CC5IF_Pos          (16U)                                        
#define TIM_SR_CC5IF_Msk          (0x1U << TIM_SR_CC5IF_Pos)                   /*!< 0x00010000 */
#define TIM_SR_CC5IF              TIM_SR_CC5IF_Msk                             /*!<Capture/Compare 5 interrupt Flag */
#define TIM_SR_CC6IF_Pos          (17U)                                        
#define TIM_SR_CC6IF_Msk          (0x1U << TIM_SR_CC6IF_Pos)                   /*!< 0x00020000 */
#define TIM_SR_CC6IF              TIM_SR_CC6IF_Msk                             /*!<Capture/Compare 6 interrupt Flag */


/*******************  Bit definition for TIM_EGR register  ********************/
#define TIM_EGR_UG_Pos            (0U)                                         
#define TIM_EGR_UG_Msk            (0x1U << TIM_EGR_UG_Pos)                     /*!< 0x00000001 */
#define TIM_EGR_UG                TIM_EGR_UG_Msk                               /*!<Update Generation */
#define TIM_EGR_CC1G_Pos          (1U)                                         
#define TIM_EGR_CC1G_Msk          (0x1U << TIM_EGR_CC1G_Pos)                   /*!< 0x00000002 */
#define TIM_EGR_CC1G              TIM_EGR_CC1G_Msk                             /*!<Capture/Compare 1 Generation */
#define TIM_EGR_CC2G_Pos          (2U)                                         
#define TIM_EGR_CC2G_Msk          (0x1U << TIM_EGR_CC2G_Pos)                   /*!< 0x00000004 */
#define TIM_EGR_CC2G              TIM_EGR_CC2G_Msk                             /*!<Capture/Compare 2 Generation */
#define TIM_EGR_CC3G_Pos          (3U)                                         
#define TIM_EGR_CC3G_Msk          (0x1U << TIM_EGR_CC3G_Pos)                   /*!< 0x00000008 */
#define TIM_EGR_CC3G              TIM_EGR_CC3G_Msk                             /*!<Capture/Compare 3 Generation */
#define TIM_EGR_CC4G_Pos          (4U)                                         
#define TIM_EGR_CC4G_Msk          (0x1U << TIM_EGR_CC4G_Pos)                   /*!< 0x00000010 */
#define TIM_EGR_CC4G              TIM_EGR_CC4G_Msk                             /*!<Capture/Compare 4 Generation */
#define TIM_EGR_COMG_Pos          (5U)                                         
#define TIM_EGR_COMG_Msk          (0x1U << TIM_EGR_COMG_Pos)                   /*!< 0x00000020 */
#define TIM_EGR_COMG              TIM_EGR_COMG_Msk                             /*!<Capture/Compare Control Update Generation */
#define TIM_EGR_TG_Pos            (6U)                                         
#define TIM_EGR_TG_Msk            (0x1U << TIM_EGR_TG_Pos)                     /*!< 0x00000040 */
#define TIM_EGR_TG                TIM_EGR_TG_Msk                               /*!<Trigger Generation */
#define TIM_EGR_BG_Pos            (7U)                                         
#define TIM_EGR_BG_Msk            (0x1U << TIM_EGR_BG_Pos)                     /*!< 0x00000080 */
#define TIM_EGR_BG                TIM_EGR_BG_Msk                               /*!<Break Generation */
#define TIM_EGR_B2G_Pos           (8U)                                         
#define TIM_EGR_B2G_Msk           (0x1U << TIM_EGR_B2G_Pos)                    /*!< 0x00000100 */
#define TIM_EGR_B2G               TIM_EGR_B2G_Msk                              /*!<Break 2 Generation */


/******************  Bit definition for TIM_CCMR1 register  *******************/
#define TIM_CCMR1_CC1S_Pos        (0U)                                         
#define TIM_CCMR1_CC1S_Msk        (0x3U << TIM_CCMR1_CC1S_Pos)                 /*!< 0x00000003 */
#define TIM_CCMR1_CC1S            TIM_CCMR1_CC1S_Msk                           /*!<CC1S[1:0] bits (Capture/Compare 1 Selection) */
#define TIM_CCMR1_CC1S_0          (0x1U << TIM_CCMR1_CC1S_Pos)                 /*!< 0x00000001 */
#define TIM_CCMR1_CC1S_1          (0x2U << TIM_CCMR1_CC1S_Pos)                 /*!< 0x00000002 */

#define TIM_CCMR1_OC1FE_Pos       (2U)                                         
#define TIM_CCMR1_OC1FE_Msk       (0x1U << TIM_CCMR1_OC1FE_Pos)                /*!< 0x00000004 */
#define TIM_CCMR1_OC1FE           TIM_CCMR1_OC1FE_Msk                          /*!<Output Compare 1 Fast enable */
#define TIM_CCMR1_OC1PE_Pos       (3U)                                         
#define TIM_CCMR1_OC1PE_Msk       (0x1U << TIM_CCMR1_OC1PE_Pos)                /*!< 0x00000008 */
#define TIM_CCMR1_OC1PE           TIM_CCMR1_OC1PE_Msk                          /*!<Output Compare 1 Preload enable */

#define TIM_CCMR1_OC1M_Pos        (4U)                                         
#define TIM_CCMR1_OC1M_Msk        (0x1007U << TIM_CCMR1_OC1M_Pos)              /*!< 0x00010070 */
#define TIM_CCMR1_OC1M            TIM_CCMR1_OC1M_Msk                           /*!<OC1M[2:0] bits (Output Compare 1 Mode) */
#define TIM_CCMR1_OC1M_0          (0x0001U << TIM_CCMR1_OC1M_Pos)              /*!< 0x00000010 */
#define TIM_CCMR1_OC1M_1          (0x0002U << TIM_CCMR1_OC1M_Pos)              /*!< 0x00000020 */
#define TIM_CCMR1_OC1M_2          (0x0004U << TIM_CCMR1_OC1M_Pos)              /*!< 0x00000040 */
#define TIM_CCMR1_OC1M_3          (0x1000U << TIM_CCMR1_OC1M_Pos)              /*!< 0x00010000 */

#define TIM_CCMR1_OC1CE_Pos       (7U)                                         
#define TIM_CCMR1_OC1CE_Msk       (0x1U << TIM_CCMR1_OC1CE_Pos)                /*!< 0x00000080 */
#define TIM_CCMR1_OC1CE           TIM_CCMR1_OC1CE_Msk                          /*!<Output Compare 1 Clear Enable */

#define TIM_CCMR1_CC2S_Pos        (8U)                                         
#define TIM_CCMR1_CC2S_Msk        (0x3U << TIM_CCMR1_CC2S_Pos)                 /*!< 0x00000300 */
#define TIM_CCMR1_CC2S            TIM_CCMR1_CC2S_Msk                           /*!<CC2S[1:0] bits (Capture/Compare 2 Selection) */
#define TIM_CCMR1_CC2S_0          (0x1U << TIM_CCMR1_CC2S_Pos)                 /*!< 0x00000100 */
#define TIM_CCMR1_CC2S_1          (0x2U << TIM_CCMR1_CC2S_Pos)                 /*!< 0x00000200 */

#define TIM_CCMR1_OC2FE_Pos       (10U)                                        
#define TIM_CCMR1_OC2FE_Msk       (0x1U << TIM_CCMR1_OC2FE_Pos)                /*!< 0x00000400 */
#define TIM_CCMR1_OC2FE           TIM_CCMR1_OC2FE_Msk                          /*!<Output Compare 2 Fast enable */
#define TIM_CCMR1_OC2PE_Pos       (11U)                                        
#define TIM_CCMR1_OC2PE_Msk       (0x1U << TIM_CCMR1_OC2PE_Pos)                /*!< 0x00000800 */
#define TIM_CCMR1_OC2PE           TIM_CCMR1_OC2PE_Msk                          /*!<Output Compare 2 Preload enable */

#define TIM_CCMR1_OC2M_Pos        (12U)                                        
#define TIM_CCMR1_OC2M_Msk        (0x1007U << TIM_CCMR1_OC2M_Pos)              /*!< 0x01007000 */
#define TIM_CCMR1_OC2M            TIM_CCMR1_OC2M_Msk                           /*!<OC2M[2:0] bits (Output Compare 2 Mode) */
#define TIM_CCMR1_OC2M_0          (0x0001U << TIM_CCMR1_OC2M_Pos)              /*!< 0x00001000 */
#define TIM_CCMR1_OC2M_1          (0x0002U << TIM_CCMR1_OC2M_Pos)              /*!< 0x00002000 */
#define TIM_CCMR1_OC2M_2          (0x0004U << TIM_CCMR1_OC2M_Pos)              /*!< 0x00004000 */
#define TIM_CCMR1_OC2M_3          (0x1000U << TIM_CCMR1_OC2M_Pos)              /*!< 0x01000000 */

#define TIM_CCMR1_OC2CE_Pos       (15U)                                        
#define TIM_CCMR1_OC2CE_Msk       (0x1U << TIM_CCMR1_OC2CE_Pos)                /*!< 0x00008000 */
#define TIM_CCMR1_OC2CE           TIM_CCMR1_OC2CE_Msk                          /*!<Output Compare 2 Clear Enable */

/*----------------------------------------------------------------------------*/
#define TIM_CCMR1_IC1PSC_Pos      (2U)                                         
#define TIM_CCMR1_IC1PSC_Msk      (0x3U << TIM_CCMR1_IC1PSC_Pos)               /*!< 0x0000000C */
#define TIM_CCMR1_IC1PSC          TIM_CCMR1_IC1PSC_Msk                         /*!<IC1PSC[1:0] bits (Input Capture 1 Prescaler) */
#define TIM_CCMR1_IC1PSC_0        (0x1U << TIM_CCMR1_IC1PSC_Pos)               /*!< 0x00000004 */
#define TIM_CCMR1_IC1PSC_1        (0x2U << TIM_CCMR1_IC1PSC_Pos)               /*!< 0x00000008 */

#define TIM_CCMR1_IC1F_Pos        (4U)                                         
#define TIM_CCMR1_IC1F_Msk        (0xFU << TIM_CCMR1_IC1F_Pos)                 /*!< 0x000000F0 */
#define TIM_CCMR1_IC1F            TIM_CCMR1_IC1F_Msk                           /*!<IC1F[3:0] bits (Input Capture 1 Filter) */
#define TIM_CCMR1_IC1F_0          (0x1U << TIM_CCMR1_IC1F_Pos)                 /*!< 0x00000010 */
#define TIM_CCMR1_IC1F_1          (0x2U << TIM_CCMR1_IC1F_Pos)                 /*!< 0x00000020 */
#define TIM_CCMR1_IC1F_2          (0x4U << TIM_CCMR1_IC1F_Pos)                 /*!< 0x00000040 */
#define TIM_CCMR1_IC1F_3          (0x8U << TIM_CCMR1_IC1F_Pos)                 /*!< 0x00000080 */

#define TIM_CCMR1_IC2PSC_Pos      (10U)                                        
#define TIM_CCMR1_IC2PSC_Msk      (0x3U << TIM_CCMR1_IC2PSC_Pos)               /*!< 0x00000C00 */
#define TIM_CCMR1_IC2PSC          TIM_CCMR1_IC2PSC_Msk                         /*!<IC2PSC[1:0] bits (Input Capture 2 Prescaler) */
#define TIM_CCMR1_IC2PSC_0        (0x1U << TIM_CCMR1_IC2PSC_Pos)               /*!< 0x00000400 */
#define TIM_CCMR1_IC2PSC_1        (0x2U << TIM_CCMR1_IC2PSC_Pos)               /*!< 0x00000800 */

#define TIM_CCMR1_IC2F_Pos        (12U)                                        
#define TIM_CCMR1_IC2F_Msk        (0xFU << TIM_CCMR1_IC2F_Pos)                 /*!< 0x0000F000 */
#define TIM_CCMR1_IC2F            TIM_CCMR1_IC2F_Msk                           /*!<IC2F[3:0] bits (Input Capture 2 Filter) */
#define TIM_CCMR1_IC2F_0          (0x1U << TIM_CCMR1_IC2F_Pos)                 /*!< 0x00001000 */
#define TIM_CCMR1_IC2F_1          (0x2U << TIM_CCMR1_IC2F_Pos)                 /*!< 0x00002000 */
#define TIM_CCMR1_IC2F_2          (0x4U << TIM_CCMR1_IC2F_Pos)                 /*!< 0x00004000 */
#define TIM_CCMR1_IC2F_3          (0x8U << TIM_CCMR1_IC2F_Pos)                 /*!< 0x00008000 */

/******************  Bit definition for TIM_CCMR2 register  *******************/
#define TIM_CCMR2_CC3S_Pos        (0U)                                         
#define TIM_CCMR2_CC3S_Msk        (0x3U << TIM_CCMR2_CC3S_Pos)                 /*!< 0x00000003 */
#define TIM_CCMR2_CC3S            TIM_CCMR2_CC3S_Msk                           /*!<CC3S[1:0] bits (Capture/Compare 3 Selection) */
#define TIM_CCMR2_CC3S_0          (0x1U << TIM_CCMR2_CC3S_Pos)                 /*!< 0x00000001 */
#define TIM_CCMR2_CC3S_1          (0x2U << TIM_CCMR2_CC3S_Pos)                 /*!< 0x00000002 */

#define TIM_CCMR2_OC3FE_Pos       (2U)                                         
#define TIM_CCMR2_OC3FE_Msk       (0x1U << TIM_CCMR2_OC3FE_Pos)                /*!< 0x00000004 */
#define TIM_CCMR2_OC3FE           TIM_CCMR2_OC3FE_Msk                          /*!<Output Compare 3 Fast enable */
#define TIM_CCMR2_OC3PE_Pos       (3U)                                         
#define TIM_CCMR2_OC3PE_Msk       (0x1U << TIM_CCMR2_OC3PE_Pos)                /*!< 0x00000008 */
#define TIM_CCMR2_OC3PE           TIM_CCMR2_OC3PE_Msk                          /*!<Output Compare 3 Preload enable */

#define TIM_CCMR2_OC3M_Pos        (4U)                                         
#define TIM_CCMR2_OC3M_Msk        (0x1007U << TIM_CCMR2_OC3M_Pos)              /*!< 0x00010070 */
#define TIM_CCMR2_OC3M            TIM_CCMR2_OC3M_Msk                           /*!<OC3M[2:0] bits (Output Compare 3 Mode) */
#define TIM_CCMR2_OC3M_0          (0x0001U << TIM_CCMR2_OC3M_Pos)              /*!< 0x00000010 */
#define TIM_CCMR2_OC3M_1          (0x0002U << TIM_CCMR2_OC3M_Pos)              /*!< 0x00000020 */
#define TIM_CCMR2_OC3M_2          (0x0004U << TIM_CCMR2_OC3M_Pos)              /*!< 0x00000040 */
#define TIM_CCMR2_OC3M_3          (0x1000U << TIM_CCMR2_OC3M_Pos)              /*!< 0x00010000 */

#define TIM_CCMR2_OC3CE_Pos       (7U)                                         
#define TIM_CCMR2_OC3CE_Msk       (0x1U << TIM_CCMR2_OC3CE_Pos)                /*!< 0x00000080 */
#define TIM_CCMR2_OC3CE           TIM_CCMR2_OC3CE_Msk                          /*!<Output Compare 3 Clear Enable */

#define TIM_CCMR2_CC4S_Pos        (8U)                                         
#define TIM_CCMR2_CC4S_Msk        (0x3U << TIM_CCMR2_CC4S_Pos)                 /*!< 0x00000300 */
#define TIM_CCMR2_CC4S            TIM_CCMR2_CC4S_Msk                           /*!<CC4S[1:0] bits (Capture/Compare 4 Selection) */
#define TIM_CCMR2_CC4S_0          (0x1U << TIM_CCMR2_CC4S_Pos)                 /*!< 0x00000100 */
#define TIM_CCMR2_CC4S_1          (0x2U << TIM_CCMR2_CC4S_Pos)                 /*!< 0x00000200 */

#define TIM_CCMR2_OC4FE_Pos       (10U)                                        
#define TIM_CCMR2_OC4FE_Msk       (0x1U << TIM_CCMR2_OC4FE_Pos)                /*!< 0x00000400 */
#define TIM_CCMR2_OC4FE           TIM_CCMR2_OC4FE_Msk                          /*!<Output Compare 4 Fast enable */
#define TIM_CCMR2_OC4PE_Pos       (11U)                                        
#define TIM_CCMR2_OC4PE_Msk       (0x1U << TIM_CCMR2_OC4PE_Pos)                /*!< 0x00000800 */
#define TIM_CCMR2_OC4PE           TIM_CCMR2_OC4PE_Msk                          /*!<Output Compare 4 Preload enable */

#define TIM_CCMR2_OC4M_Pos        (12U)                                        
#define TIM_CCMR2_OC4M_Msk        (0x1007U << TIM_CCMR2_OC4M_Pos)              /*!< 0x01007000 */
#define TIM_CCMR2_OC4M            TIM_CCMR2_OC4M_Msk                           /*!<OC4M[2:0] bits (Output Compare 4 Mode) */
#define TIM_CCMR2_OC4M_0          (0x0001U << TIM_CCMR2_OC4M_Pos)              /*!< 0x00001000 */
#define TIM_CCMR2_OC4M_1          (0x0002U << TIM_CCMR2_OC4M_Pos)              /*!< 0x00002000 */
#define TIM_CCMR2_OC4M_2          (0x0004U << TIM_CCMR2_OC4M_Pos)              /*!< 0x00004000 */
#define TIM_CCMR2_OC4M_3          (0x1000U << TIM_CCMR2_OC4M_Pos)              /*!< 0x01000000 */

#define TIM_CCMR2_OC4CE_Pos       (15U)                                        
#define TIM_CCMR2_OC4CE_Msk       (0x1U << TIM_CCMR2_OC4CE_Pos)                /*!< 0x00008000 */
#define TIM_CCMR2_OC4CE           TIM_CCMR2_OC4CE_Msk                          /*!<Output Compare 4 Clear Enable */

/*----------------------------------------------------------------------------*/
#define TIM_CCMR2_IC3PSC_Pos      (2U)                                         
#define TIM_CCMR2_IC3PSC_Msk      (0x3U << TIM_CCMR2_IC3PSC_Pos)               /*!< 0x0000000C */
#define TIM_CCMR2_IC3PSC          TIM_CCMR2_IC3PSC_Msk                         /*!<IC3PSC[1:0] bits (Input Capture 3 Prescaler) */
#define TIM_CCMR2_IC3PSC_0        (0x1U << TIM_CCMR2_IC3PSC_Pos)               /*!< 0x00000004 */
#define TIM_CCMR2_IC3PSC_1        (0x2U << TIM_CCMR2_IC3PSC_Pos)               /*!< 0x00000008 */

#define TIM_CCMR2_IC3F_Pos        (4U)                                         
#define TIM_CCMR2_IC3F_Msk        (0xFU << TIM_CCMR2_IC3F_Pos)                 /*!< 0x000000F0 */
#define TIM_CCMR2_IC3F            TIM_CCMR2_IC3F_Msk                           /*!<IC3F[3:0] bits (Input Capture 3 Filter) */
#define TIM_CCMR2_IC3F_0          (0x1U << TIM_CCMR2_IC3F_Pos)                 /*!< 0x00000010 */
#define TIM_CCMR2_IC3F_1          (0x2U << TIM_CCMR2_IC3F_Pos)                 /*!< 0x00000020 */
#define TIM_CCMR2_IC3F_2          (0x4U << TIM_CCMR2_IC3F_Pos)                 /*!< 0x00000040 */
#define TIM_CCMR2_IC3F_3          (0x8U << TIM_CCMR2_IC3F_Pos)                 /*!< 0x00000080 */

#define TIM_CCMR2_IC4PSC_Pos      (10U)                                        
#define TIM_CCMR2_IC4PSC_Msk      (0x3U << TIM_CCMR2_IC4PSC_Pos)               /*!< 0x00000C00 */
#define TIM_CCMR2_IC4PSC          TIM_CCMR2_IC4PSC_Msk                         /*!<IC4PSC[1:0] bits (Input Capture 4 Prescaler) */
#define TIM_CCMR2_IC4PSC_0        (0x1U << TIM_CCMR2_IC4PSC_Pos)               /*!< 0x00000400 */
#define TIM_CCMR2_IC4PSC_1        (0x2U << TIM_CCMR2_IC4PSC_Pos)               /*!< 0x00000800 */

#define TIM_CCMR2_IC4F_Pos        (12U)                                        
#define TIM_CCMR2_IC4F_Msk        (0xFU << TIM_CCMR2_IC4F_Pos)                 /*!< 0x0000F000 */
#define TIM_CCMR2_IC4F            TIM_CCMR2_IC4F_Msk                           /*!<IC4F[3:0] bits (Input Capture 4 Filter) */
#define TIM_CCMR2_IC4F_0          (0x1U << TIM_CCMR2_IC4F_Pos)                 /*!< 0x00001000 */
#define TIM_CCMR2_IC4F_1          (0x2U << TIM_CCMR2_IC4F_Pos)                 /*!< 0x00002000 */
#define TIM_CCMR2_IC4F_2          (0x4U << TIM_CCMR2_IC4F_Pos)                 /*!< 0x00004000 */
#define TIM_CCMR2_IC4F_3          (0x8U << TIM_CCMR2_IC4F_Pos)                 /*!< 0x00008000 */

/******************  Bit definition for TIM_CCMR3 register  *******************/
#define TIM_CCMR3_OC5FE_Pos       (2U)                                         
#define TIM_CCMR3_OC5FE_Msk       (0x1U << TIM_CCMR3_OC5FE_Pos)                /*!< 0x00000004 */
#define TIM_CCMR3_OC5FE           TIM_CCMR3_OC5FE_Msk                          /*!<Output Compare 5 Fast enable */
#define TIM_CCMR3_OC5PE_Pos       (3U)                                         
#define TIM_CCMR3_OC5PE_Msk       (0x1U << TIM_CCMR3_OC5PE_Pos)                /*!< 0x00000008 */
#define TIM_CCMR3_OC5PE           TIM_CCMR3_OC5PE_Msk                          /*!<Output Compare 5 Preload enable */

#define TIM_CCMR3_OC5M_Pos        (4U)                                         
#define TIM_CCMR3_OC5M_Msk        (0x1007U << TIM_CCMR3_OC5M_Pos)              /*!< 0x00010070 */
#define TIM_CCMR3_OC5M            TIM_CCMR3_OC5M_Msk                           /*!<OC5M[3:0] bits (Output Compare 5 Mode) */
#define TIM_CCMR3_OC5M_0          (0x0001U << TIM_CCMR3_OC5M_Pos)              /*!< 0x00000010 */
#define TIM_CCMR3_OC5M_1          (0x0002U << TIM_CCMR3_OC5M_Pos)              /*!< 0x00000020 */
#define TIM_CCMR3_OC5M_2          (0x0004U << TIM_CCMR3_OC5M_Pos)              /*!< 0x00000040 */
#define TIM_CCMR3_OC5M_3          (0x1000U << TIM_CCMR3_OC5M_Pos)              /*!< 0x00010000 */

#define TIM_CCMR3_OC5CE_Pos       (7U)                                         
#define TIM_CCMR3_OC5CE_Msk       (0x1U << TIM_CCMR3_OC5CE_Pos)                /*!< 0x00000080 */
#define TIM_CCMR3_OC5CE           TIM_CCMR3_OC5CE_Msk                          /*!<Output Compare 5 Clear Enable */

#define TIM_CCMR3_OC6FE_Pos       (10U)                                        
#define TIM_CCMR3_OC6FE_Msk       (0x1U << TIM_CCMR3_OC6FE_Pos)                /*!< 0x00000400 */
#define TIM_CCMR3_OC6FE           TIM_CCMR3_OC6FE_Msk                          /*!<Output Compare 6 Fast enable */
#define TIM_CCMR3_OC6PE_Pos       (11U)                                        
#define TIM_CCMR3_OC6PE_Msk       (0x1U << TIM_CCMR3_OC6PE_Pos)                /*!< 0x00000800 */
#define TIM_CCMR3_OC6PE           TIM_CCMR3_OC6PE_Msk                          /*!<Output Compare 6 Preload enable */

#define TIM_CCMR3_OC6M_Pos        (12U)                                        
#define TIM_CCMR3_OC6M_Msk        (0x1007U << TIM_CCMR3_OC6M_Pos)              /*!< 0x01007000 */
#define TIM_CCMR3_OC6M            TIM_CCMR3_OC6M_Msk                           /*!<OC6M[3:0] bits (Output Compare 6 Mode) */
#define TIM_CCMR3_OC6M_0          (0x0001U << TIM_CCMR3_OC6M_Pos)              /*!< 0x00001000 */
#define TIM_CCMR3_OC6M_1          (0x0002U << TIM_CCMR3_OC6M_Pos)              /*!< 0x00002000 */
#define TIM_CCMR3_OC6M_2          (0x0004U << TIM_CCMR3_OC6M_Pos)              /*!< 0x00004000 */
#define TIM_CCMR3_OC6M_3          (0x1000U << TIM_CCMR3_OC6M_Pos)              /*!< 0x01000000 */

#define TIM_CCMR3_OC6CE_Pos       (15U)                                        
#define TIM_CCMR3_OC6CE_Msk       (0x1U << TIM_CCMR3_OC6CE_Pos)                /*!< 0x00008000 */
#define TIM_CCMR3_OC6CE           TIM_CCMR3_OC6CE_Msk                          /*!<Output Compare 6 Clear Enable */

/*******************  Bit definition for TIM_CCER register  *******************/
#define TIM_CCER_CC1E_Pos         (0U)                                         
#define TIM_CCER_CC1E_Msk         (0x1U << TIM_CCER_CC1E_Pos)                  /*!< 0x00000001 */
#define TIM_CCER_CC1E             TIM_CCER_CC1E_Msk                            /*!<Capture/Compare 1 output enable */
#define TIM_CCER_CC1P_Pos         (1U)                                         
#define TIM_CCER_CC1P_Msk         (0x1U << TIM_CCER_CC1P_Pos)                  /*!< 0x00000002 */
#define TIM_CCER_CC1P             TIM_CCER_CC1P_Msk                            /*!<Capture/Compare 1 output Polarity */
#define TIM_CCER_CC1NE_Pos        (2U)                                         
#define TIM_CCER_CC1NE_Msk        (0x1U << TIM_CCER_CC1NE_Pos)                 /*!< 0x00000004 */
#define TIM_CCER_CC1NE            TIM_CCER_CC1NE_Msk                           /*!<Capture/Compare 1 Complementary output enable */
#define TIM_CCER_CC1NP_Pos        (3U)                                         
#define TIM_CCER_CC1NP_Msk        (0x1U << TIM_CCER_CC1NP_Pos)                 /*!< 0x00000008 */
#define TIM_CCER_CC1NP            TIM_CCER_CC1NP_Msk                           /*!<Capture/Compare 1 Complementary output Polarity */
#define TIM_CCER_CC2E_Pos         (4U)                                         
#define TIM_CCER_CC2E_Msk         (0x1U << TIM_CCER_CC2E_Pos)                  /*!< 0x00000010 */
#define TIM_CCER_CC2E             TIM_CCER_CC2E_Msk                            /*!<Capture/Compare 2 output enable */
#define TIM_CCER_CC2P_Pos         (5U)                                         
#define TIM_CCER_CC2P_Msk         (0x1U << TIM_CCER_CC2P_Pos)                  /*!< 0x00000020 */
#define TIM_CCER_CC2P             TIM_CCER_CC2P_Msk                            /*!<Capture/Compare 2 output Polarity */
#define TIM_CCER_CC2NE_Pos        (6U)                                         
#define TIM_CCER_CC2NE_Msk        (0x1U << TIM_CCER_CC2NE_Pos)                 /*!< 0x00000040 */
#define TIM_CCER_CC2NE            TIM_CCER_CC2NE_Msk                           /*!<Capture/Compare 2 Complementary output enable */
#define TIM_CCER_CC2NP_Pos        (7U)                                         
#define TIM_CCER_CC2NP_Msk        (0x1U << TIM_CCER_CC2NP_Pos)                 /*!< 0x00000080 */
#define TIM_CCER_CC2NP            TIM_CCER_CC2NP_Msk                           /*!<Capture/Compare 2 Complementary output Polarity */
#define TIM_CCER_CC3E_Pos         (8U)                                         
#define TIM_CCER_CC3E_Msk         (0x1U << TIM_CCER_CC3E_Pos)                  /*!< 0x00000100 */
#define TIM_CCER_CC3E             TIM_CCER_CC3E_Msk                            /*!<Capture/Compare 3 output enable */
#define TIM_CCER_CC3P_Pos         (9U)                                         
#define TIM_CCER_CC3P_Msk         (0x1U << TIM_CCER_CC3P_Pos)                  /*!< 0x00000200 */
#define TIM_CCER_CC3P             TIM_CCER_CC3P_Msk                            /*!<Capture/Compare 3 output Polarity */
#define TIM_CCER_CC3NE_Pos        (10U)                                        
#define TIM_CCER_CC3NE_Msk        (0x1U << TIM_CCER_CC3NE_Pos)                 /*!< 0x00000400 */
#define TIM_CCER_CC3NE            TIM_CCER_CC3NE_Msk                           /*!<Capture/Compare 3 Complementary output enable */
#define TIM_CCER_CC3NP_Pos        (11U)                                        
#define TIM_CCER_CC3NP_Msk        (0x1U << TIM_CCER_CC3NP_Pos)                 /*!< 0x00000800 */
#define TIM_CCER_CC3NP            TIM_CCER_CC3NP_Msk                           /*!<Capture/Compare 3 Complementary output Polarity */
#define TIM_CCER_CC4E_Pos         (12U)                                        
#define TIM_CCER_CC4E_Msk         (0x1U << TIM_CCER_CC4E_Pos)                  /*!< 0x00001000 */
#define TIM_CCER_CC4E             TIM_CCER_CC4E_Msk                            /*!<Capture/Compare 4 output enable */
#define TIM_CCER_CC4P_Pos         (13U)                                        
#define TIM_CCER_CC4P_Msk         (0x1U << TIM_CCER_CC4P_Pos)                  /*!< 0x00002000 */
#define TIM_CCER_CC4P             TIM_CCER_CC4P_Msk                            /*!<Capture/Compare 4 output Polarity */
#define TIM_CCER_CC4NP_Pos        (15U)                                        
#define TIM_CCER_CC4NP_Msk        (0x1U << TIM_CCER_CC4NP_Pos)                 /*!< 0x00008000 */
#define TIM_CCER_CC4NP            TIM_CCER_CC4NP_Msk                           /*!<Capture/Compare 4 Complementary output Polarity */
#define TIM_CCER_CC5E_Pos         (16U)                                        
#define TIM_CCER_CC5E_Msk         (0x1U << TIM_CCER_CC5E_Pos)                  /*!< 0x00010000 */
#define TIM_CCER_CC5E             TIM_CCER_CC5E_Msk                            /*!<Capture/Compare 5 output enable */
#define TIM_CCER_CC5P_Pos         (17U)                                        
#define TIM_CCER_CC5P_Msk         (0x1U << TIM_CCER_CC5P_Pos)                  /*!< 0x00020000 */
#define TIM_CCER_CC5P             TIM_CCER_CC5P_Msk                            /*!<Capture/Compare 5 output Polarity */
#define TIM_CCER_CC6E_Pos         (20U)                                        
#define TIM_CCER_CC6E_Msk         (0x1U << TIM_CCER_CC6E_Pos)                  /*!< 0x00100000 */
#define TIM_CCER_CC6E             TIM_CCER_CC6E_Msk                            /*!<Capture/Compare 6 output enable */
#define TIM_CCER_CC6P_Pos         (21U)                                        
#define TIM_CCER_CC6P_Msk         (0x1U << TIM_CCER_CC6P_Pos)                  /*!< 0x00200000 */
#define TIM_CCER_CC6P             TIM_CCER_CC6P_Msk                            /*!<Capture/Compare 6 output Polarity */

/*******************  Bit definition for TIM_CNT register  ********************/
#define TIM_CNT_CNT_Pos           (0U)                                         
#define TIM_CNT_CNT_Msk           (0xFFFFFFFFU << TIM_CNT_CNT_Pos)             /*!< 0xFFFFFFFF */
#define TIM_CNT_CNT               TIM_CNT_CNT_Msk                              /*!<Counter Value */
#define TIM_CNT_UIFCPY_Pos        (31U)                                        
#define TIM_CNT_UIFCPY_Msk        (0x1U << TIM_CNT_UIFCPY_Pos)                 /*!< 0x80000000 */
#define TIM_CNT_UIFCPY            TIM_CNT_UIFCPY_Msk                           /*!<Update interrupt flag copy (if UIFREMAP=1) */

/*******************  Bit definition for TIM_PSC register  ********************/
#define TIM_PSC_PSC_Pos           (0U)                                         
#define TIM_PSC_PSC_Msk           (0xFFFFU << TIM_PSC_PSC_Pos)                 /*!< 0x0000FFFF */
#define TIM_PSC_PSC               TIM_PSC_PSC_Msk                              /*!<Prescaler Value */

/*******************  Bit definition for TIM_ARR register  ********************/
#define TIM_ARR_ARR_Pos           (0U)                                         
#define TIM_ARR_ARR_Msk           (0xFFFFFFFFU << TIM_ARR_ARR_Pos)             /*!< 0xFFFFFFFF */
#define TIM_ARR_ARR               TIM_ARR_ARR_Msk                              /*!<Actual auto-reload Value */

/*******************  Bit definition for TIM_RCR register  ********************/
#define TIM_RCR_REP_Pos           (0U)                                         
#define TIM_RCR_REP_Msk           (0xFFFFU << TIM_RCR_REP_Pos)                 /*!< 0x0000FFFF */
#define TIM_RCR_REP               TIM_RCR_REP_Msk                              /*!<Repetition Counter Value */

/*******************  Bit definition for TIM_CCR1 register  *******************/
#define TIM_CCR1_CCR1_Pos         (0U)                                         
#define TIM_CCR1_CCR1_Msk         (0xFFFFU << TIM_CCR1_CCR1_Pos)               /*!< 0x0000FFFF */
#define TIM_CCR1_CCR1             TIM_CCR1_CCR1_Msk                            /*!<Capture/Compare 1 Value */

/*******************  Bit definition for TIM_CCR2 register  *******************/
#define TIM_CCR2_CCR2_Pos         (0U)                                         
#define TIM_CCR2_CCR2_Msk         (0xFFFFU << TIM_CCR2_CCR2_Pos)               /*!< 0x0000FFFF */
#define TIM_CCR2_CCR2             TIM_CCR2_CCR2_Msk                            /*!<Capture/Compare 2 Value */

/*******************  Bit definition for TIM_CCR3 register  *******************/
#define TIM_CCR3_CCR3_Pos         (0U)                                         
#define TIM_CCR3_CCR3_Msk         (0xFFFFU << TIM_CCR3_CCR3_Pos)               /*!< 0x0000FFFF */
#define TIM_CCR3_CCR3             TIM_CCR3_CCR3_Msk                            /*!<Capture/Compare 3 Value */

/*******************  Bit definition for TIM_CCR4 register  *******************/
#define TIM_CCR4_CCR4_Pos         (0U)                                         
#define TIM_CCR4_CCR4_Msk         (0xFFFFU << TIM_CCR4_CCR4_Pos)               /*!< 0x0000FFFF */
#define TIM_CCR4_CCR4             TIM_CCR4_CCR4_Msk                            /*!<Capture/Compare 4 Value */

/*******************  Bit definition for TIM_CCR5 register  *******************/
#define TIM_CCR5_CCR5_Pos         (0U)                                         
#define TIM_CCR5_CCR5_Msk         (0xFFFFFFFFU << TIM_CCR5_CCR5_Pos)           /*!< 0xFFFFFFFF */
#define TIM_CCR5_CCR5             TIM_CCR5_CCR5_Msk                            /*!<Capture/Compare 5 Value */
#define TIM_CCR5_GC5C1_Pos        (29U)                                        
#define TIM_CCR5_GC5C1_Msk        (0x1U << TIM_CCR5_GC5C1_Pos)                 /*!< 0x20000000 */
#define TIM_CCR5_GC5C1            TIM_CCR5_GC5C1_Msk                           /*!<Group Channel 5 and Channel 1 */
#define TIM_CCR5_GC5C2_Pos        (30U)                                        
#define TIM_CCR5_GC5C2_Msk        (0x1U << TIM_CCR5_GC5C2_Pos)                 /*!< 0x40000000 */
#define TIM_CCR5_GC5C2            TIM_CCR5_GC5C2_Msk                           /*!<Group Channel 5 and Channel 2 */
#define TIM_CCR5_GC5C3_Pos        (31U)                                        
#define TIM_CCR5_GC5C3_Msk        (0x1U << TIM_CCR5_GC5C3_Pos)                 /*!< 0x80000000 */
#define TIM_CCR5_GC5C3            TIM_CCR5_GC5C3_Msk                           /*!<Group Channel 5 and Channel 3 */

/*******************  Bit definition for TIM_CCR6 register  *******************/
#define TIM_CCR6_CCR6_Pos         (0U)                                         
#define TIM_CCR6_CCR6_Msk         (0xFFFFU << TIM_CCR6_CCR6_Pos)               /*!< 0x0000FFFF */
#define TIM_CCR6_CCR6             TIM_CCR6_CCR6_Msk                            /*!<Capture/Compare 6 Value */

/*******************  Bit definition for TIM_BDTR register  *******************/
#define TIM_BDTR_DTG_Pos          (0U)                                         
#define TIM_BDTR_DTG_Msk          (0xFFU << TIM_BDTR_DTG_Pos)                  /*!< 0x000000FF */
#define TIM_BDTR_DTG              TIM_BDTR_DTG_Msk                             /*!<DTG[0:7] bits (Dead-Time Generator set-up) */
#define TIM_BDTR_DTG_0            (0x01U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000001 */
#define TIM_BDTR_DTG_1            (0x02U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000002 */
#define TIM_BDTR_DTG_2            (0x04U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000004 */
#define TIM_BDTR_DTG_3            (0x08U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000008 */
#define TIM_BDTR_DTG_4            (0x10U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000010 */
#define TIM_BDTR_DTG_5            (0x20U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000020 */
#define TIM_BDTR_DTG_6            (0x40U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000040 */
#define TIM_BDTR_DTG_7            (0x80U << TIM_BDTR_DTG_Pos)                  /*!< 0x00000080 */

#define TIM_BDTR_LOCK_Pos         (8U)                                         
#define TIM_BDTR_LOCK_Msk         (0x3U << TIM_BDTR_LOCK_Pos)                  /*!< 0x00000300 */
#define TIM_BDTR_LOCK             TIM_BDTR_LOCK_Msk                            /*!<LOCK[1:0] bits (Lock Configuration) */
#define TIM_BDTR_LOCK_0           (0x1U << TIM_BDTR_LOCK_Pos)                  /*!< 0x00000100 */
#define TIM_BDTR_LOCK_1           (0x2U << TIM_BDTR_LOCK_Pos)                  /*!< 0x00000200 */

#define TIM_BDTR_OSSI_Pos         (10U)                                        
#define TIM_BDTR_OSSI_Msk         (0x1U << TIM_BDTR_OSSI_Pos)                  /*!< 0x00000400 */
#define TIM_BDTR_OSSI             TIM_BDTR_OSSI_Msk                            /*!<Off-State Selection for Idle mode */
#define TIM_BDTR_OSSR_Pos         (11U)                                        
#define TIM_BDTR_OSSR_Msk         (0x1U << TIM_BDTR_OSSR_Pos)                  /*!< 0x00000800 */
#define TIM_BDTR_OSSR             TIM_BDTR_OSSR_Msk                            /*!<Off-State Selection for Run mode */
#define TIM_BDTR_BKE_Pos          (12U)                                        
#define TIM_BDTR_BKE_Msk          (0x1U << TIM_BDTR_BKE_Pos)                   /*!< 0x00001000 */
#define TIM_BDTR_BKE              TIM_BDTR_BKE_Msk                             /*!<Break enable for Break 1 */
#define TIM_BDTR_BKP_Pos          (13U)                                        
#define TIM_BDTR_BKP_Msk          (0x1U << TIM_BDTR_BKP_Pos)                   /*!< 0x00002000 */
#define TIM_BDTR_BKP              TIM_BDTR_BKP_Msk                             /*!<Break Polarity for Break 1 */
#define TIM_BDTR_AOE_Pos          (14U)                                        
#define TIM_BDTR_AOE_Msk          (0x1U << TIM_BDTR_AOE_Pos)                   /*!< 0x00004000 */
#define TIM_BDTR_AOE              TIM_BDTR_AOE_Msk                             /*!<Automatic Output enable */
#define TIM_BDTR_MOE_Pos          (15U)                                        
#define TIM_BDTR_MOE_Msk          (0x1U << TIM_BDTR_MOE_Pos)                   /*!< 0x00008000 */
#define TIM_BDTR_MOE              TIM_BDTR_MOE_Msk                             /*!<Main Output enable */

#define TIM_BDTR_BKF_Pos          (16U)                                        
#define TIM_BDTR_BKF_Msk          (0xFU << TIM_BDTR_BKF_Pos)                   /*!< 0x000F0000 */
#define TIM_BDTR_BKF              TIM_BDTR_BKF_Msk                             /*!<Break Filter for Break 1 */
#define TIM_BDTR_BK2F_Pos         (20U)                                        
#define TIM_BDTR_BK2F_Msk         (0xFU << TIM_BDTR_BK2F_Pos)                  /*!< 0x00F00000 */
#define TIM_BDTR_BK2F             TIM_BDTR_BK2F_Msk                            /*!<Break Filter for Break 2 */

#define TIM_BDTR_BK2E_Pos         (24U)                                        
#define TIM_BDTR_BK2E_Msk         (0x1U << TIM_BDTR_BK2E_Pos)                  /*!< 0x01000000 */
#define TIM_BDTR_BK2E             TIM_BDTR_BK2E_Msk                            /*!<Break enable for Break 2 */
#define TIM_BDTR_BK2P_Pos         (25U)                                        
#define TIM_BDTR_BK2P_Msk         (0x1U << TIM_BDTR_BK2P_Pos)                  /*!< 0x02000000 */
#define TIM_BDTR_BK2P             TIM_BDTR_BK2P_Msk                            /*!<Break Polarity for Break 2 */

/*******************  Bit definition for TIM_DCR register  ********************/
#define TIM_DCR_DBA_Pos           (0U)                                         
#define TIM_DCR_DBA_Msk           (0x1FU << TIM_DCR_DBA_Pos)                   /*!< 0x0000001F */
#define TIM_DCR_DBA               TIM_DCR_DBA_Msk                              /*!<DBA[4:0] bits (DMA Base Address) */
#define TIM_DCR_DBA_0             (0x01U << TIM_DCR_DBA_Pos)                   /*!< 0x00000001 */
#define TIM_DCR_DBA_1             (0x02U << TIM_DCR_DBA_Pos)                   /*!< 0x00000002 */
#define TIM_DCR_DBA_2             (0x04U << TIM_DCR_DBA_Pos)                   /*!< 0x00000004 */
#define TIM_DCR_DBA_3             (0x08U << TIM_DCR_DBA_Pos)                   /*!< 0x00000008 */
#define TIM_DCR_DBA_4             (0x10U << TIM_DCR_DBA_Pos)                   /*!< 0x00000010 */

#define TIM_DCR_DBL_Pos           (8U)                                         
#define TIM_DCR_DBL_Msk           (0x1FU << TIM_DCR_DBL_Pos)                   /*!< 0x00001F00 */
#define TIM_DCR_DBL               TIM_DCR_DBL_Msk                              /*!<DBL[4:0] bits (DMA Burst Length) */
#define TIM_DCR_DBL_0             (0x01U << TIM_DCR_DBL_Pos)                   /*!< 0x00000100 */
#define TIM_DCR_DBL_1             (0x02U << TIM_DCR_DBL_Pos)                   /*!< 0x00000200 */
#define TIM_DCR_DBL_2             (0x04U << TIM_DCR_DBL_Pos)                   /*!< 0x00000400 */
#define TIM_DCR_DBL_3             (0x08U << TIM_DCR_DBL_Pos)                   /*!< 0x00000800 */
#define TIM_DCR_DBL_4             (0x10U << TIM_DCR_DBL_Pos)                   /*!< 0x00001000 */

/*******************  Bit definition for TIM_DMAR register  *******************/
#define TIM_DMAR_DMAB_Pos         (0U)                                         
#define TIM_DMAR_DMAB_Msk         (0xFFFFU << TIM_DMAR_DMAB_Pos)               /*!< 0x0000FFFF */
#define TIM_DMAR_DMAB             TIM_DMAR_DMAB_Msk                            /*!<DMA register for burst accesses */

/*******************  Bit definition for TIM1_OR1 register  *******************/
#define TIM1_OR1_ETR_ADC1_RMP_Pos      (0U)                                    
#define TIM1_OR1_ETR_ADC1_RMP_Msk      (0x3U << TIM1_OR1_ETR_ADC1_RMP_Pos)     /*!< 0x00000003 */
#define TIM1_OR1_ETR_ADC1_RMP          TIM1_OR1_ETR_ADC1_RMP_Msk               /*!<ETR_ADC1_RMP[1:0] bits (TIM1 ETR remap on ADC1) */
#define TIM1_OR1_ETR_ADC1_RMP_0        (0x1U << TIM1_OR1_ETR_ADC1_RMP_Pos)     /*!< 0x00000001 */
#define TIM1_OR1_ETR_ADC1_RMP_1        (0x2U << TIM1_OR1_ETR_ADC1_RMP_Pos)     /*!< 0x00000002 */

#define TIM1_OR1_ETR_ADC3_RMP_Pos      (2U)                                    
#define TIM1_OR1_ETR_ADC3_RMP_Msk      (0x3U << TIM1_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x0000000C */
#define TIM1_OR1_ETR_ADC3_RMP          TIM1_OR1_ETR_ADC3_RMP_Msk               /*!<ETR_ADC3_RMP[1:0] bits (TIM1 ETR remap on ADC3) */
#define TIM1_OR1_ETR_ADC3_RMP_0        (0x1U << TIM1_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x00000004 */
#define TIM1_OR1_ETR_ADC3_RMP_1        (0x2U << TIM1_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x00000008 */

#define TIM1_OR1_TI1_RMP_Pos           (4U)                                    
#define TIM1_OR1_TI1_RMP_Msk           (0x1U << TIM1_OR1_TI1_RMP_Pos)          /*!< 0x00000010 */
#define TIM1_OR1_TI1_RMP               TIM1_OR1_TI1_RMP_Msk                    /*!<TIM1 Input Capture 1 remap */

/*******************  Bit definition for TIM1_OR2 register  *******************/
#define TIM1_OR2_BKINE_Pos             (0U)                                    
#define TIM1_OR2_BKINE_Msk             (0x1U << TIM1_OR2_BKINE_Pos)            /*!< 0x00000001 */
#define TIM1_OR2_BKINE                 TIM1_OR2_BKINE_Msk                      /*!<BRK BKIN input enable */
#define TIM1_OR2_BKCMP1E_Pos           (1U)                                    
#define TIM1_OR2_BKCMP1E_Msk           (0x1U << TIM1_OR2_BKCMP1E_Pos)          /*!< 0x00000002 */
#define TIM1_OR2_BKCMP1E               TIM1_OR2_BKCMP1E_Msk                    /*!<BRK COMP1 enable */
#define TIM1_OR2_BKCMP2E_Pos           (2U)                                    
#define TIM1_OR2_BKCMP2E_Msk           (0x1U << TIM1_OR2_BKCMP2E_Pos)          /*!< 0x00000004 */
#define TIM1_OR2_BKCMP2E               TIM1_OR2_BKCMP2E_Msk                    /*!<BRK COMP2 enable */
#define TIM1_OR2_BKDF1BK0E_Pos         (8U)                                    
#define TIM1_OR2_BKDF1BK0E_Msk         (0x1U << TIM1_OR2_BKDF1BK0E_Pos)        /*!< 0x00000100 */
#define TIM1_OR2_BKDF1BK0E             TIM1_OR2_BKDF1BK0E_Msk                  /*!<BRK DFSDM1_BREAK[0] enable */
#define TIM1_OR2_BKINP_Pos             (9U)                                    
#define TIM1_OR2_BKINP_Msk             (0x1U << TIM1_OR2_BKINP_Pos)            /*!< 0x00000200 */
#define TIM1_OR2_BKINP                 TIM1_OR2_BKINP_Msk                      /*!<BRK BKIN input polarity */
#define TIM1_OR2_BKCMP1P_Pos           (10U)                                   
#define TIM1_OR2_BKCMP1P_Msk           (0x1U << TIM1_OR2_BKCMP1P_Pos)          /*!< 0x00000400 */
#define TIM1_OR2_BKCMP1P               TIM1_OR2_BKCMP1P_Msk                    /*!<BRK COMP1 input polarity */
#define TIM1_OR2_BKCMP2P_Pos           (11U)                                   
#define TIM1_OR2_BKCMP2P_Msk           (0x1U << TIM1_OR2_BKCMP2P_Pos)          /*!< 0x00000800 */
#define TIM1_OR2_BKCMP2P               TIM1_OR2_BKCMP2P_Msk                    /*!<BRK COMP2 input polarity */

#define TIM1_OR2_ETRSEL_Pos            (14U)                                   
#define TIM1_OR2_ETRSEL_Msk            (0x7U << TIM1_OR2_ETRSEL_Pos)           /*!< 0x0001C000 */
#define TIM1_OR2_ETRSEL                TIM1_OR2_ETRSEL_Msk                     /*!<ETRSEL[2:0] bits (TIM1 ETR source selection) */
#define TIM1_OR2_ETRSEL_0              (0x1U << TIM1_OR2_ETRSEL_Pos)           /*!< 0x00004000 */
#define TIM1_OR2_ETRSEL_1              (0x2U << TIM1_OR2_ETRSEL_Pos)           /*!< 0x00008000 */
#define TIM1_OR2_ETRSEL_2              (0x4U << TIM1_OR2_ETRSEL_Pos)           /*!< 0x00010000 */

/*******************  Bit definition for TIM1_OR3 register  *******************/
#define TIM1_OR3_BK2INE_Pos            (0U)                                    
#define TIM1_OR3_BK2INE_Msk            (0x1U << TIM1_OR3_BK2INE_Pos)           /*!< 0x00000001 */
#define TIM1_OR3_BK2INE                TIM1_OR3_BK2INE_Msk                     /*!<BRK2 BKIN2 input enable */
#define TIM1_OR3_BK2CMP1E_Pos          (1U)                                    
#define TIM1_OR3_BK2CMP1E_Msk          (0x1U << TIM1_OR3_BK2CMP1E_Pos)         /*!< 0x00000002 */
#define TIM1_OR3_BK2CMP1E              TIM1_OR3_BK2CMP1E_Msk                   /*!<BRK2 COMP1 enable */
#define TIM1_OR3_BK2CMP2E_Pos          (2U)                                    
#define TIM1_OR3_BK2CMP2E_Msk          (0x1U << TIM1_OR3_BK2CMP2E_Pos)         /*!< 0x00000004 */
#define TIM1_OR3_BK2CMP2E              TIM1_OR3_BK2CMP2E_Msk                   /*!<BRK2 COMP2 enable */
#define TIM1_OR3_BK2DF1BK1E_Pos        (8U)                                    
#define TIM1_OR3_BK2DF1BK1E_Msk        (0x1U << TIM1_OR3_BK2DF1BK1E_Pos)       /*!< 0x00000100 */
#define TIM1_OR3_BK2DF1BK1E            TIM1_OR3_BK2DF1BK1E_Msk                 /*!<BRK2 DFSDM1_BREAK[1] enable */
#define TIM1_OR3_BK2INP_Pos            (9U)                                    
#define TIM1_OR3_BK2INP_Msk            (0x1U << TIM1_OR3_BK2INP_Pos)           /*!< 0x00000200 */
#define TIM1_OR3_BK2INP                TIM1_OR3_BK2INP_Msk                     /*!<BRK2 BKIN2 input polarity */
#define TIM1_OR3_BK2CMP1P_Pos          (10U)                                   
#define TIM1_OR3_BK2CMP1P_Msk          (0x1U << TIM1_OR3_BK2CMP1P_Pos)         /*!< 0x00000400 */
#define TIM1_OR3_BK2CMP1P              TIM1_OR3_BK2CMP1P_Msk                   /*!<BRK2 COMP1 input polarity */
#define TIM1_OR3_BK2CMP2P_Pos          (11U)                                   
#define TIM1_OR3_BK2CMP2P_Msk          (0x1U << TIM1_OR3_BK2CMP2P_Pos)         /*!< 0x00000800 */
#define TIM1_OR3_BK2CMP2P              TIM1_OR3_BK2CMP2P_Msk                   /*!<BRK2 COMP2 input polarity */

/*******************  Bit definition for TIM8_OR1 register  *******************/
#define TIM8_OR1_ETR_ADC2_RMP_Pos      (0U)                                    
#define TIM8_OR1_ETR_ADC2_RMP_Msk      (0x3U << TIM8_OR1_ETR_ADC2_RMP_Pos)     /*!< 0x00000003 */
#define TIM8_OR1_ETR_ADC2_RMP          TIM8_OR1_ETR_ADC2_RMP_Msk               /*!<ETR_ADC2_RMP[1:0] bits (TIM8 ETR remap on ADC2) */
#define TIM8_OR1_ETR_ADC2_RMP_0        (0x1U << TIM8_OR1_ETR_ADC2_RMP_Pos)     /*!< 0x00000001 */
#define TIM8_OR1_ETR_ADC2_RMP_1        (0x2U << TIM8_OR1_ETR_ADC2_RMP_Pos)     /*!< 0x00000002 */

#define TIM8_OR1_ETR_ADC3_RMP_Pos      (2U)                                    
#define TIM8_OR1_ETR_ADC3_RMP_Msk      (0x3U << TIM8_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x0000000C */
#define TIM8_OR1_ETR_ADC3_RMP          TIM8_OR1_ETR_ADC3_RMP_Msk               /*!<ETR_ADC3_RMP[1:0] bits (TIM8 ETR remap on ADC3) */
#define TIM8_OR1_ETR_ADC3_RMP_0        (0x1U << TIM8_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x00000004 */
#define TIM8_OR1_ETR_ADC3_RMP_1        (0x2U << TIM8_OR1_ETR_ADC3_RMP_Pos)     /*!< 0x00000008 */

#define TIM8_OR1_TI1_RMP_Pos           (4U)                                    
#define TIM8_OR1_TI1_RMP_Msk           (0x1U << TIM8_OR1_TI1_RMP_Pos)          /*!< 0x00000010 */
#define TIM8_OR1_TI1_RMP               TIM8_OR1_TI1_RMP_Msk                    /*!<TIM8 Input Capture 1 remap */

/*******************  Bit definition for TIM8_OR2 register  *******************/
#define TIM8_OR2_BKINE_Pos             (0U)                                    
#define TIM8_OR2_BKINE_Msk             (0x1U << TIM8_OR2_BKINE_Pos)            /*!< 0x00000001 */
#define TIM8_OR2_BKINE                 TIM8_OR2_BKINE_Msk                      /*!<BRK BKIN input enable */
#define TIM8_OR2_BKCMP1E_Pos           (1U)                                    
#define TIM8_OR2_BKCMP1E_Msk           (0x1U << TIM8_OR2_BKCMP1E_Pos)          /*!< 0x00000002 */
#define TIM8_OR2_BKCMP1E               TIM8_OR2_BKCMP1E_Msk                    /*!<BRK COMP1 enable */
#define TIM8_OR2_BKCMP2E_Pos           (2U)                                    
#define TIM8_OR2_BKCMP2E_Msk           (0x1U << TIM8_OR2_BKCMP2E_Pos)          /*!< 0x00000004 */
#define TIM8_OR2_BKCMP2E               TIM8_OR2_BKCMP2E_Msk                    /*!<BRK COMP2 enable */
#define TIM8_OR2_BKDF1BK2E_Pos         (8U)                                    
#define TIM8_OR2_BKDF1BK2E_Msk         (0x1U << TIM8_OR2_BKDF1BK2E_Pos)        /*!< 0x00000100 */
#define TIM8_OR2_BKDF1BK2E             TIM8_OR2_BKDF1BK2E_Msk                  /*!<BRK DFSDM1_BREAK[2] enable */
#define TIM8_OR2_BKINP_Pos             (9U)                                    
#define TIM8_OR2_BKINP_Msk             (0x1U << TIM8_OR2_BKINP_Pos)            /*!< 0x00000200 */
#define TIM8_OR2_BKINP                 TIM8_OR2_BKINP_Msk                      /*!<BRK BKIN input polarity */
#define TIM8_OR2_BKCMP1P_Pos           (10U)                                   
#define TIM8_OR2_BKCMP1P_Msk           (0x1U << TIM8_OR2_BKCMP1P_Pos)          /*!< 0x00000400 */
#define TIM8_OR2_BKCMP1P               TIM8_OR2_BKCMP1P_Msk                    /*!<BRK COMP1 input polarity */
#define TIM8_OR2_BKCMP2P_Pos           (11U)                                   
#define TIM8_OR2_BKCMP2P_Msk           (0x1U << TIM8_OR2_BKCMP2P_Pos)          /*!< 0x00000800 */
#define TIM8_OR2_BKCMP2P               TIM8_OR2_BKCMP2P_Msk                    /*!<BRK COMP2 input polarity */

#define TIM8_OR2_ETRSEL_Pos            (14U)                                   
#define TIM8_OR2_ETRSEL_Msk            (0x7U << TIM8_OR2_ETRSEL_Pos)           /*!< 0x0001C000 */
#define TIM8_OR2_ETRSEL                TIM8_OR2_ETRSEL_Msk                     /*!<ETRSEL[2:0] bits (TIM8 ETR source selection) */
#define TIM8_OR2_ETRSEL_0              (0x1U << TIM8_OR2_ETRSEL_Pos)           /*!< 0x00004000 */
#define TIM8_OR2_ETRSEL_1              (0x2U << TIM8_OR2_ETRSEL_Pos)           /*!< 0x00008000 */
#define TIM8_OR2_ETRSEL_2              (0x4U << TIM8_OR2_ETRSEL_Pos)           /*!< 0x00010000 */

/*******************  Bit definition for TIM8_OR3 register  *******************/
#define TIM8_OR3_BK2INE_Pos            (0U)                                    
#define TIM8_OR3_BK2INE_Msk            (0x1U << TIM8_OR3_BK2INE_Pos)           /*!< 0x00000001 */
#define TIM8_OR3_BK2INE                TIM8_OR3_BK2INE_Msk                     /*!<BRK2 BKIN2 input enable */
#define TIM8_OR3_BK2CMP1E_Pos          (1U)                                    
#define TIM8_OR3_BK2CMP1E_Msk          (0x1U << TIM8_OR3_BK2CMP1E_Pos)         /*!< 0x00000002 */
#define TIM8_OR3_BK2CMP1E              TIM8_OR3_BK2CMP1E_Msk                   /*!<BRK2 COMP1 enable */
#define TIM8_OR3_BK2CMP2E_Pos          (2U)                                    
#define TIM8_OR3_BK2CMP2E_Msk          (0x1U << TIM8_OR3_BK2CMP2E_Pos)         /*!< 0x00000004 */
#define TIM8_OR3_BK2CMP2E              TIM8_OR3_BK2CMP2E_Msk                   /*!<BRK2 COMP2 enable */
#define TIM8_OR3_BK2DF1BK3E_Pos        (8U)                                    
#define TIM8_OR3_BK2DF1BK3E_Msk        (0x1U << TIM8_OR3_BK2DF1BK3E_Pos)       /*!< 0x00000100 */
#define TIM8_OR3_BK2DF1BK3E            TIM8_OR3_BK2DF1BK3E_Msk                 /*!<BRK2 DFSDM1_BREAK[3] enable */
#define TIM8_OR3_BK2INP_Pos            (9U)                                    
#define TIM8_OR3_BK2INP_Msk            (0x1U << TIM8_OR3_BK2INP_Pos)           /*!< 0x00000200 */
#define TIM8_OR3_BK2INP                TIM8_OR3_BK2INP_Msk                     /*!<BRK2 BKIN2 input polarity */
#define TIM8_OR3_BK2CMP1P_Pos          (10U)                                   
#define TIM8_OR3_BK2CMP1P_Msk          (0x1U << TIM8_OR3_BK2CMP1P_Pos)         /*!< 0x00000400 */
#define TIM8_OR3_BK2CMP1P              TIM8_OR3_BK2CMP1P_Msk                   /*!<BRK2 COMP1 input polarity */
#define TIM8_OR3_BK2CMP2P_Pos          (11U)                                   
#define TIM8_OR3_BK2CMP2P_Msk          (0x1U << TIM8_OR3_BK2CMP2P_Pos)         /*!< 0x00000800 */
#define TIM8_OR3_BK2CMP2P              TIM8_OR3_BK2CMP2P_Msk                   /*!<BRK2 COMP2 input polarity */

/*******************  Bit definition for TIM2_OR1 register  *******************/
#define TIM2_OR1_ITR1_RMP_Pos     (0U)                                         
#define TIM2_OR1_ITR1_RMP_Msk     (0x1U << TIM2_OR1_ITR1_RMP_Pos)              /*!< 0x00000001 */
#define TIM2_OR1_ITR1_RMP         TIM2_OR1_ITR1_RMP_Msk                        /*!<TIM2 Internal trigger 1 remap */
#define TIM2_OR1_ETR1_RMP_Pos     (1U)                                         
#define TIM2_OR1_ETR1_RMP_Msk     (0x1U << TIM2_OR1_ETR1_RMP_Pos)              /*!< 0x00000002 */
#define TIM2_OR1_ETR1_RMP         TIM2_OR1_ETR1_RMP_Msk                        /*!<TIM2 External trigger 1 remap */

#define TIM2_OR1_TI4_RMP_Pos      (2U)                                         
#define TIM2_OR1_TI4_RMP_Msk      (0x3U << TIM2_OR1_TI4_RMP_Pos)               /*!< 0x0000000C */
#define TIM2_OR1_TI4_RMP          TIM2_OR1_TI4_RMP_Msk                         /*!<TI4_RMP[1:0] bits (TIM2 Input Capture 4 remap) */
#define TIM2_OR1_TI4_RMP_0        (0x1U << TIM2_OR1_TI4_RMP_Pos)               /*!< 0x00000004 */
#define TIM2_OR1_TI4_RMP_1        (0x2U << TIM2_OR1_TI4_RMP_Pos)               /*!< 0x00000008 */

/*******************  Bit definition for TIM2_OR2 register  *******************/
#define TIM2_OR2_ETRSEL_Pos       (14U)                                        
#define TIM2_OR2_ETRSEL_Msk       (0x7U << TIM2_OR2_ETRSEL_Pos)                /*!< 0x0001C000 */
#define TIM2_OR2_ETRSEL           TIM2_OR2_ETRSEL_Msk                          /*!<ETRSEL[2:0] bits (TIM2 ETR source selection) */
#define TIM2_OR2_ETRSEL_0         (0x1U << TIM2_OR2_ETRSEL_Pos)                /*!< 0x00004000 */
#define TIM2_OR2_ETRSEL_1         (0x2U << TIM2_OR2_ETRSEL_Pos)                /*!< 0x00008000 */
#define TIM2_OR2_ETRSEL_2         (0x4U << TIM2_OR2_ETRSEL_Pos)                /*!< 0x00010000 */

/*******************  Bit definition for TIM3_OR1 register  *******************/
#define TIM3_OR1_TI1_RMP_Pos      (0U)                                         
#define TIM3_OR1_TI1_RMP_Msk      (0x3U << TIM3_OR1_TI1_RMP_Pos)               /*!< 0x00000003 */
#define TIM3_OR1_TI1_RMP          TIM3_OR1_TI1_RMP_Msk                         /*!<TI1_RMP[1:0] bits (TIM3 Input Capture 1 remap) */
#define TIM3_OR1_TI1_RMP_0        (0x1U << TIM3_OR1_TI1_RMP_Pos)               /*!< 0x00000001 */
#define TIM3_OR1_TI1_RMP_1        (0x2U << TIM3_OR1_TI1_RMP_Pos)               /*!< 0x00000002 */

/*******************  Bit definition for TIM3_OR2 register  *******************/
#define TIM3_OR2_ETRSEL_Pos       (14U)                                        
#define TIM3_OR2_ETRSEL_Msk       (0x7U << TIM3_OR2_ETRSEL_Pos)                /*!< 0x0001C000 */
#define TIM3_OR2_ETRSEL           TIM3_OR2_ETRSEL_Msk                          /*!<ETRSEL[2:0] bits (TIM3 ETR source selection) */
#define TIM3_OR2_ETRSEL_0         (0x1U << TIM3_OR2_ETRSEL_Pos)                /*!< 0x00004000 */
#define TIM3_OR2_ETRSEL_1         (0x2U << TIM3_OR2_ETRSEL_Pos)                /*!< 0x00008000 */
#define TIM3_OR2_ETRSEL_2         (0x4U << TIM3_OR2_ETRSEL_Pos)                /*!< 0x00010000 */

/*******************  Bit definition for TIM15_OR1 register  ******************/
#define TIM15_OR1_TI1_RMP_Pos           (0U)                                   
#define TIM15_OR1_TI1_RMP_Msk           (0x1U << TIM15_OR1_TI1_RMP_Pos)        /*!< 0x00000001 */
#define TIM15_OR1_TI1_RMP               TIM15_OR1_TI1_RMP_Msk                  /*!<TIM15 Input Capture 1 remap */

#define TIM15_OR1_ENCODER_MODE_Pos      (1U)                                   
#define TIM15_OR1_ENCODER_MODE_Msk      (0x3U << TIM15_OR1_ENCODER_MODE_Pos)   /*!< 0x00000006 */
#define TIM15_OR1_ENCODER_MODE          TIM15_OR1_ENCODER_MODE_Msk             /*!<ENCODER_MODE[1:0] bits (TIM15 Encoder mode) */
#define TIM15_OR1_ENCODER_MODE_0        (0x1U << TIM15_OR1_ENCODER_MODE_Pos)   /*!< 0x00000002 */
#define TIM15_OR1_ENCODER_MODE_1        (0x2U << TIM15_OR1_ENCODER_MODE_Pos)   /*!< 0x00000004 */

/*******************  Bit definition for TIM15_OR2 register  ******************/
#define TIM15_OR2_BKINE_Pos             (0U)                                   
#define TIM15_OR2_BKINE_Msk             (0x1U << TIM15_OR2_BKINE_Pos)          /*!< 0x00000001 */
#define TIM15_OR2_BKINE                 TIM15_OR2_BKINE_Msk                    /*!<BRK BKIN input enable */
#define TIM15_OR2_BKCMP1E_Pos           (1U)                                   
#define TIM15_OR2_BKCMP1E_Msk           (0x1U << TIM15_OR2_BKCMP1E_Pos)        /*!< 0x00000002 */
#define TIM15_OR2_BKCMP1E               TIM15_OR2_BKCMP1E_Msk                  /*!<BRK COMP1 enable */
#define TIM15_OR2_BKCMP2E_Pos           (2U)                                   
#define TIM15_OR2_BKCMP2E_Msk           (0x1U << TIM15_OR2_BKCMP2E_Pos)        /*!< 0x00000004 */
#define TIM15_OR2_BKCMP2E               TIM15_OR2_BKCMP2E_Msk                  /*!<BRK COMP2 enable */
#define TIM15_OR2_BKDF1BK0E_Pos         (8U)                                   
#define TIM15_OR2_BKDF1BK0E_Msk         (0x1U << TIM15_OR2_BKDF1BK0E_Pos)      /*!< 0x00000100 */
#define TIM15_OR2_BKDF1BK0E             TIM15_OR2_BKDF1BK0E_Msk                /*!<BRK DFSDM1_BREAK[0] enable */
#define TIM15_OR2_BKINP_Pos             (9U)                                   
#define TIM15_OR2_BKINP_Msk             (0x1U << TIM15_OR2_BKINP_Pos)          /*!< 0x00000200 */
#define TIM15_OR2_BKINP                 TIM15_OR2_BKINP_Msk                    /*!<BRK BKIN input polarity */
#define TIM15_OR2_BKCMP1P_Pos           (10U)                                  
#define TIM15_OR2_BKCMP1P_Msk           (0x1U << TIM15_OR2_BKCMP1P_Pos)        /*!< 0x00000400 */
#define TIM15_OR2_BKCMP1P               TIM15_OR2_BKCMP1P_Msk                  /*!<BRK COMP1 input polarity */
#define TIM15_OR2_BKCMP2P_Pos           (11U)                                  
#define TIM15_OR2_BKCMP2P_Msk           (0x1U << TIM15_OR2_BKCMP2P_Pos)        /*!< 0x00000800 */
#define TIM15_OR2_BKCMP2P               TIM15_OR2_BKCMP2P_Msk                  /*!<BRK COMP2 input polarity */

/*******************  Bit definition for TIM16_OR1 register  ******************/
#define TIM16_OR1_TI1_RMP_Pos      (0U)                                        
#define TIM16_OR1_TI1_RMP_Msk      (0x3U << TIM16_OR1_TI1_RMP_Pos)             /*!< 0x00000003 */
#define TIM16_OR1_TI1_RMP          TIM16_OR1_TI1_RMP_Msk                       /*!<TI1_RMP[1:0] bits (TIM16 Input Capture 1 remap) */
#define TIM16_OR1_TI1_RMP_0        (0x1U << TIM16_OR1_TI1_RMP_Pos)             /*!< 0x00000001 */
#define TIM16_OR1_TI1_RMP_1        (0x2U << TIM16_OR1_TI1_RMP_Pos)             /*!< 0x00000002 */

/*******************  Bit definition for TIM16_OR2 register  ******************/
#define TIM16_OR2_BKINE_Pos        (0U)                                        
#define TIM16_OR2_BKINE_Msk        (0x1U << TIM16_OR2_BKINE_Pos)               /*!< 0x00000001 */
#define TIM16_OR2_BKINE            TIM16_OR2_BKINE_Msk                         /*!<BRK BKIN input enable */
#define TIM16_OR2_BKCMP1E_Pos      (1U)                                        
#define TIM16_OR2_BKCMP1E_Msk      (0x1U << TIM16_OR2_BKCMP1E_Pos)             /*!< 0x00000002 */
#define TIM16_OR2_BKCMP1E          TIM16_OR2_BKCMP1E_Msk                       /*!<BRK COMP1 enable */
#define TIM16_OR2_BKCMP2E_Pos      (2U)                                        
#define TIM16_OR2_BKCMP2E_Msk      (0x1U << TIM16_OR2_BKCMP2E_Pos)             /*!< 0x00000004 */
#define TIM16_OR2_BKCMP2E          TIM16_OR2_BKCMP2E_Msk                       /*!<BRK COMP2 enable */
#define TIM16_OR2_BKDF1BK1E_Pos    (8U)                                        
#define TIM16_OR2_BKDF1BK1E_Msk    (0x1U << TIM16_OR2_BKDF1BK1E_Pos)           /*!< 0x00000100 */
#define TIM16_OR2_BKDF1BK1E        TIM16_OR2_BKDF1BK1E_Msk                     /*!<BRK DFSDM1_BREAK[1] enable */
#define TIM16_OR2_BKINP_Pos        (9U)                                        
#define TIM16_OR2_BKINP_Msk        (0x1U << TIM16_OR2_BKINP_Pos)               /*!< 0x00000200 */
#define TIM16_OR2_BKINP            TIM16_OR2_BKINP_Msk                         /*!<BRK BKIN input polarity */
#define TIM16_OR2_BKCMP1P_Pos      (10U)                                       
#define TIM16_OR2_BKCMP1P_Msk      (0x1U << TIM16_OR2_BKCMP1P_Pos)             /*!< 0x00000400 */
#define TIM16_OR2_BKCMP1P          TIM16_OR2_BKCMP1P_Msk                       /*!<BRK COMP1 input polarity */
#define TIM16_OR2_BKCMP2P_Pos      (11U)                                       
#define TIM16_OR2_BKCMP2P_Msk      (0x1U << TIM16_OR2_BKCMP2P_Pos)             /*!< 0x00000800 */
#define TIM16_OR2_BKCMP2P          TIM16_OR2_BKCMP2P_Msk                       /*!<BRK COMP2 input polarity */

/*******************  Bit definition for TIM17_OR1 register  ******************/
#define TIM17_OR1_TI1_RMP_Pos      (0U)                                        
#define TIM17_OR1_TI1_RMP_Msk      (0x3U << TIM17_OR1_TI1_RMP_Pos)             /*!< 0x00000003 */
#define TIM17_OR1_TI1_RMP          TIM17_OR1_TI1_RMP_Msk                       /*!<TI1_RMP[1:0] bits (TIM17 Input Capture 1 remap) */
#define TIM17_OR1_TI1_RMP_0        (0x1U << TIM17_OR1_TI1_RMP_Pos)             /*!< 0x00000001 */
#define TIM17_OR1_TI1_RMP_1        (0x2U << TIM17_OR1_TI1_RMP_Pos)             /*!< 0x00000002 */

/*******************  Bit definition for TIM17_OR2 register  ******************/
#define TIM17_OR2_BKINE_Pos        (0U)                                        
#define TIM17_OR2_BKINE_Msk        (0x1U << TIM17_OR2_BKINE_Pos)               /*!< 0x00000001 */
#define TIM17_OR2_BKINE            TIM17_OR2_BKINE_Msk                         /*!<BRK BKIN input enable */
#define TIM17_OR2_BKCMP1E_Pos      (1U)                                        
#define TIM17_OR2_BKCMP1E_Msk      (0x1U << TIM17_OR2_BKCMP1E_Pos)             /*!< 0x00000002 */
#define TIM17_OR2_BKCMP1E          TIM17_OR2_BKCMP1E_Msk                       /*!<BRK COMP1 enable */
#define TIM17_OR2_BKCMP2E_Pos      (2U)                                        
#define TIM17_OR2_BKCMP2E_Msk      (0x1U << TIM17_OR2_BKCMP2E_Pos)             /*!< 0x00000004 */
#define TIM17_OR2_BKCMP2E          TIM17_OR2_BKCMP2E_Msk                       /*!<BRK COMP2 enable */
#define TIM17_OR2_BKDF1BK2E_Pos    (8U)                                        
#define TIM17_OR2_BKDF1BK2E_Msk    (0x1U << TIM17_OR2_BKDF1BK2E_Pos)           /*!< 0x00000100 */
#define TIM17_OR2_BKDF1BK2E        TIM17_OR2_BKDF1BK2E_Msk                     /*!<BRK DFSDM1_BREAK[2] enable */
#define TIM17_OR2_BKINP_Pos        (9U)                                        
#define TIM17_OR2_BKINP_Msk        (0x1U << TIM17_OR2_BKINP_Pos)               /*!< 0x00000200 */
#define TIM17_OR2_BKINP            TIM17_OR2_BKINP_Msk                         /*!<BRK BKIN input polarity */
#define TIM17_OR2_BKCMP1P_Pos      (10U)                                       
#define TIM17_OR2_BKCMP1P_Msk      (0x1U << TIM17_OR2_BKCMP1P_Pos)             /*!< 0x00000400 */
#define TIM17_OR2_BKCMP1P          TIM17_OR2_BKCMP1P_Msk                       /*!<BRK COMP1 input polarity */
#define TIM17_OR2_BKCMP2P_Pos      (11U)                                       
#define TIM17_OR2_BKCMP2P_Msk      (0x1U << TIM17_OR2_BKCMP2P_Pos)             /*!< 0x00000800 */
#define TIM17_OR2_BKCMP2P          TIM17_OR2_BKCMP2P_Msk                       /*!<BRK COMP2 input polarity */
