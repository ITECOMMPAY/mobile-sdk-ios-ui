#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class MsdkCoreMSDKCoreSessionConfig, MsdkCoreMSDKCoreSessionCompanion, MsdkCoreCardRemoveInteractor, MsdkCorePayment, MsdkCoreErrorEventInteractor, MsdkCoreInitInteractor, MsdkCorePayInteractor, MsdkCorePaymentInfo, MsdkCorePaymentMethod, MsdkCoreSavedAccount, MsdkCoreKotlinx_serialization_jsonJson, MsdkCoreMSDKCoreMetadata, MsdkCoreMSDKCoreMockConfig, MsdkCoreMSDKCoreSessionConfigCompanion, MsdkCoreUserAgentData, MsdkCoreDuration, MsdkCoreDeviceScreenResolutionInfo, MsdkCoreApplicationInfo, MsdkCoreKotlinEnumCompanion, MsdkCoreKotlinEnum<E>, MsdkCoreErrorCodeCompanion, MsdkCoreErrorCode, MsdkCoreKotlinArray<T>, MsdkCoreKotlinThrowable, MsdkCoreApiLinkMessageLink, MsdkCoreApiLinkMessageCompanion, MsdkCoreApiLinkMessage, MsdkCoreApiLinkMessageLinkCompanion, MsdkCoreThreeDSecureInfo, MsdkCorePaymentInfoCompanion, MsdkCoreRecipientInfoCompanion, MsdkCoreRecurrentInfoSchedule, MsdkCoreRecurrentInfoCompanion, MsdkCoreRecurrentInfoScheduleCompanion, MsdkCoreClarificationFieldCompanion, MsdkCoreClarificationField, MsdkCoreClarificationFieldValueCompanion, MsdkCoreClarificationFieldValue, MsdkCoreCompleteFieldCompanion, MsdkCoreCompleteField, MsdkCoreFieldServerType, MsdkCoreCustomerFieldOption, MsdkCoreCustomerField, MsdkCoreCustomerFieldOptionCompanion, MsdkCoreCustomerFieldValueCompanion, MsdkCoreCustomerFieldValue, MsdkCoreFieldServerTypeCompanion, MsdkCorePaymentFieldValueCompanion, MsdkCorePaymentFieldValue, MsdkCoreSenderFieldValueCompanion, MsdkCoreSenderFieldValue, MsdkCoreAccountFactory, MsdkCoreAccount, MsdkCoreWalletSaveMode, MsdkCoreCardTypesManager, MsdkCorePaymentMethodType, MsdkCorePaymentMethodTypeCompanion, MsdkCoreSdkExpiry, MsdkCoreSavedAccountCompanion, MsdkCoreWalletSaveModeCompanion, MsdkCoreLink, MsdkCorePaymentStatus, MsdkCoreAcs, MsdkCoreThreeds2, MsdkCoreConsentData, MsdkCoreRedirectInfo, MsdkCorePaymentFlow, MsdkCorePaymentCompanion, MsdkCorePaymentStatusCompanion, MsdkCoreConsentDataCompanion, MsdkCoreRedirectInfoCompanion, MsdkCoreAcsCompanion, MsdkCoreAcsPageCompanion, MsdkCoreAcsReturnUrlCompanion, MsdkCoreThreeDSecureAccountInfoCompanion, MsdkCoreThreeDSecureAccountInfo, MsdkCoreThreeDSecureShippingInfo, MsdkCoreThreeDSecureMpiResultInfo, MsdkCoreThreeDSecureCustomerInfoCompanion, MsdkCoreThreeDSecureCustomerInfo, MsdkCoreThreeDSecureGiftCardInfoCompanion, MsdkCoreThreeDSecureGiftCardInfo, MsdkCoreThreeDSecurePaymentInfo, MsdkCoreThreeDSecureInfoFactory, MsdkCoreThreeDSecureMpiResultInfoCompanion, MsdkCoreThreeDSecurePageType, MsdkCoreThreeDSecurePageCompanion, MsdkCoreThreeDSecurePageTypeCompanion, MsdkCoreThreeDSecurePaymentInfoCompanion, MsdkCoreThreeDSecureShippingInfoCompanion, MsdkCoreThreeds2Iframe, MsdkCoreThreeds2Redirect, MsdkCoreThreeds2Companion, MsdkCoreThreeds2IframeCompanion, MsdkCoreThreeds2RedirectCompanion, MsdkCoreErrorEventRequest, MsdkCoreRequest, MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher, MsdkCoreBaseInteractor<R, T>, MsdkCoreCardRemoveRequest, MsdkCoreInitRequest, MsdkCoreRecurrentInfo, MsdkCoreThreeDSecurePage, MsdkCorePayRequest, MsdkCoreApplePayRequest, MsdkCoreRecipientInfo, MsdkCoreStoredCardTypeCompanion, MsdkCoreStoredCardType, MsdkCoreCardPayRequest, MsdkCoreCardDate, MsdkCoreNewCardSaleRequest, MsdkCoreGooglePayEnvironment, MsdkCoreGooglePayRequest, MsdkCoreCardTypesManagerCompanion, MsdkCorePaymentMethodCard, MsdkCoreLinkMessage, MsdkCoreMockInitConfig, MsdkCoreMockPaymentStatusesConfig, MsdkCoreMSDKCoreMockConfigCompanion, MsdkCoreMockInitCustomerFieldsConfig, MsdkCoreMockBaseStatus, MsdkCoreMockPaymentStatusesConfigCompanion, MsdkCoreKotlinException, MsdkCoreMockErrorStatus, MsdkCoreCustomHeadersPluginPlugin, MsdkCoreCustomHeadersPlugin, MsdkCoreKtor_client_coreHttpClient, MsdkCoreKtor_utilsAttributeKey<T>, MsdkCoreCustomHeadersPluginConfig, MsdkCoreJsonFixTranslationsAsMapPluginPlugin, MsdkCoreJsonFixTranslationsAsMapPlugin, MsdkCoreJsonFixTranslationsAsMapPluginConfig, MsdkCoreJsonPluginPlugin, MsdkCoreKtor_httpContentType, MsdkCoreJsonPlugin, MsdkCoreJsonPluginConfig, MsdkCoreDurationCompanion, MsdkCoreBaseValidator, MsdkCoreRegexWithLengthValidator, MsdkCoreLengthValidator, MsdkCoreRegexValidator, MsdkCoreRegexWithMaxMinLengthValidator, MsdkCoreKotlinByteIterator, MsdkCoreKotlinByteArray, NSData, MsdkCoreKotlinx_serialization_coreSerializersModule, MsdkCoreKotlinx_serialization_jsonJsonDefault, MsdkCoreKotlinx_serialization_jsonJsonElement, MsdkCoreKotlinx_serialization_jsonJsonConfiguration, MsdkCoreKotlinAbstractCoroutineContextElement, MsdkCoreKotlinx_coroutines_coreCoroutineDispatcherKey, MsdkCoreKtor_client_coreHttpClientEngineConfig, MsdkCoreKtor_client_coreHttpClientConfig<T>, MsdkCoreKtor_eventsEvents, MsdkCoreKtor_client_coreHttpReceivePipeline, MsdkCoreKtor_client_coreHttpRequestPipeline, MsdkCoreKtor_client_coreHttpResponsePipeline, MsdkCoreKtor_client_coreHttpSendPipeline, MsdkCoreKtor_utilsTypeInfo, MsdkCoreKtor_ioInput, MsdkCoreKtor_httpOutgoingContent, MsdkCoreKtor_httpHeaderValueParam, MsdkCoreKtor_httpHeaderValueWithParametersCompanion, MsdkCoreKtor_httpHeaderValueWithParameters, MsdkCoreKtor_httpContentTypeCompanion, MsdkCoreKotlinx_serialization_jsonJsonElementCompanion, MsdkCoreKotlinx_serialization_coreSerialKind, MsdkCoreKotlinNothing, MsdkCoreKotlinAbstractCoroutineContextKey<B, E>, MsdkCoreKtor_client_coreHttpRequestData, MsdkCoreKtor_client_coreHttpResponseData, MsdkCoreKtor_client_coreProxyConfig, MsdkCoreKtor_eventsEventDefinition<T>, MsdkCoreKtor_utilsPipelinePhase, MsdkCoreKtor_utilsPipeline<TSubject, TContext>, MsdkCoreKtor_client_coreHttpReceivePipelinePhases, MsdkCoreKtor_client_coreHttpResponse, MsdkCoreKotlinUnit, MsdkCoreKtor_client_coreHttpRequestPipelinePhases, MsdkCoreKtor_client_coreHttpRequestBuilder, MsdkCoreKtor_client_coreHttpResponsePipelinePhases, MsdkCoreKtor_client_coreHttpResponseContainer, MsdkCoreKtor_client_coreHttpClientCall, MsdkCoreKtor_client_coreHttpSendPipelinePhases, MsdkCoreKtor_ioChunkBuffer, MsdkCoreKtor_ioInputCompanion, MsdkCoreKtor_ioMemory, MsdkCoreKtor_httpHttpStatusCode, MsdkCoreKotlinRuntimeException, MsdkCoreKotlinIllegalStateException, MsdkCoreKtor_httpUrl, MsdkCoreKtor_httpHttpMethod, MsdkCoreKtor_utilsGMTDate, MsdkCoreKtor_httpHttpProtocolVersion, MsdkCoreKtor_httpHeadersBuilder, MsdkCoreKtor_client_coreHttpRequestBuilderCompanion, MsdkCoreKtor_httpURLBuilder, MsdkCoreKtor_client_coreHttpClientCallCompanion, MsdkCoreKotlinKTypeProjection, MsdkCoreKtor_ioBufferCompanion, MsdkCoreKtor_ioBuffer, MsdkCoreKtor_ioChunkBufferCompanion, MsdkCoreKtor_ioMemoryCompanion, MsdkCoreKtor_httpHttpStatusCodeCompanion, MsdkCoreKtor_httpUrlCompanion, MsdkCoreKtor_httpURLProtocol, MsdkCoreKtor_httpHttpMethodCompanion, MsdkCoreKotlinCancellationException, MsdkCoreKtor_utilsGMTDateCompanion, MsdkCoreKtor_utilsWeekDay, MsdkCoreKtor_utilsMonth, MsdkCoreKtor_httpHttpProtocolVersionCompanion, MsdkCoreKtor_ioByteReadPacket, MsdkCoreKtor_utilsStringValuesBuilderImpl, MsdkCoreKtor_httpURLBuilderCompanion, MsdkCoreKotlinKVariance, MsdkCoreKotlinKTypeProjectionCompanion, MsdkCoreKtor_httpURLProtocolCompanion, MsdkCoreKtor_utilsWeekDayCompanion, MsdkCoreKtor_utilsMonthCompanion, MsdkCoreKtor_ioByteReadPacketCompanion;

@protocol MsdkCoreCancellable, MsdkCoreSecureLogoResourceManager, MsdkCoreStringResourceManager, MsdkCoreKotlinComparable, MsdkCoreKotlinx_serialization_coreKSerializer, MsdkCoreValidator, MsdkCoreErrorEventDelegate, MsdkCoreCardRemoveDelegate, MsdkCoreInitDelegate, MsdkCorePaymentStatusDelegate, MsdkCorePayDelegate, MsdkCoreKtor_client_coreHttpClientPlugin, MsdkCoreKtor_client_jsonJsonSerializer, MsdkCoreKtor_httpContentTypeMatcher, MsdkCoreKtor_client_loggingLogger, MsdkCoreKotlinx_serialization_coreDeserializationStrategy, MsdkCoreKotlinx_serialization_coreSerializationStrategy, MsdkCoreKotlinx_serialization_coreSerialFormat, MsdkCoreKotlinx_serialization_coreStringFormat, MsdkCoreKotlinIterator, MsdkCoreKotlinx_serialization_coreEncoder, MsdkCoreKotlinx_serialization_coreSerialDescriptor, MsdkCoreKotlinx_serialization_coreDecoder, MsdkCoreKotlinCoroutineContextKey, MsdkCoreKotlinCoroutineContextElement, MsdkCoreKotlinCoroutineContext, MsdkCoreKotlinContinuation, MsdkCoreKotlinContinuationInterceptor, MsdkCoreKotlinx_coroutines_coreRunnable, MsdkCoreKotlinx_coroutines_coreCoroutineScope, MsdkCoreKtor_ioCloseable, MsdkCoreKtor_client_coreHttpClientEngine, MsdkCoreKtor_client_coreHttpClientEngineCapability, MsdkCoreKtor_utilsAttributes, MsdkCoreKotlinx_serialization_coreSerializersModuleCollector, MsdkCoreKotlinKClass, MsdkCoreKotlinx_serialization_jsonJsonNamingStrategy, MsdkCoreKotlinx_serialization_coreCompositeEncoder, MsdkCoreKotlinAnnotation, MsdkCoreKotlinx_serialization_coreCompositeDecoder, MsdkCoreKotlinx_coroutines_coreDisposableHandle, MsdkCoreKotlinSuspendFunction2, MsdkCoreKotlinKType, MsdkCoreKtor_ioObjectPool, MsdkCoreKotlinAppendable, MsdkCoreKtor_httpHeaders, MsdkCoreKotlinKDeclarationContainer, MsdkCoreKotlinKAnnotatedElement, MsdkCoreKotlinKClassifier, MsdkCoreKotlinx_coroutines_coreJob, MsdkCoreKotlinFunction, MsdkCoreKtor_httpHttpMessage, MsdkCoreKtor_ioByteReadChannel, MsdkCoreKtor_httpHttpMessageBuilder, MsdkCoreKtor_client_coreHttpRequest, MsdkCoreKotlinMapEntry, MsdkCoreKtor_utilsStringValues, MsdkCoreKtor_httpParameters, MsdkCoreKotlinx_coroutines_coreChildHandle, MsdkCoreKotlinx_coroutines_coreChildJob, MsdkCoreKotlinSequence, MsdkCoreKotlinx_coroutines_coreSelectClause0, MsdkCoreKtor_ioReadSession, MsdkCoreKotlinSuspendFunction1, MsdkCoreKtor_utilsStringValuesBuilder, MsdkCoreKtor_httpParametersBuilder, MsdkCoreKotlinx_coroutines_coreParentJob, MsdkCoreKotlinx_coroutines_coreSelectInstance, MsdkCoreKotlinx_coroutines_coreSelectClause;

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wnullability"

#pragma push_macro("_Nullable_result")
#if !__has_feature(nullability_nullable_result)
#undef _Nullable_result
#define _Nullable_result _Nullable
#endif

__attribute__((swift_name("KotlinBase")))
@interface MsdkCoreBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end

@interface MsdkCoreBase (MsdkCoreBaseCopying) <NSCopying>
@end

__attribute__((swift_name("KotlinMutableSet")))
@interface MsdkCoreMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end

__attribute__((swift_name("KotlinMutableDictionary")))
@interface MsdkCoreMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end

@interface NSError (NSErrorMsdkCoreKotlinException)
@property (readonly) id _Nullable kotlinException;
@end

__attribute__((swift_name("KotlinNumber")))
@interface MsdkCoreNumber : NSNumber
- (instancetype)initWithChar:(char)value __attribute__((unavailable));
- (instancetype)initWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
- (instancetype)initWithShort:(short)value __attribute__((unavailable));
- (instancetype)initWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
- (instancetype)initWithInt:(int)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
- (instancetype)initWithLong:(long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
- (instancetype)initWithLongLong:(long long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
- (instancetype)initWithFloat:(float)value __attribute__((unavailable));
- (instancetype)initWithDouble:(double)value __attribute__((unavailable));
- (instancetype)initWithBool:(BOOL)value __attribute__((unavailable));
- (instancetype)initWithInteger:(NSInteger)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
+ (instancetype)numberWithChar:(char)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
+ (instancetype)numberWithShort:(short)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
+ (instancetype)numberWithInt:(int)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
+ (instancetype)numberWithLong:(long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
+ (instancetype)numberWithLongLong:(long long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
+ (instancetype)numberWithFloat:(float)value __attribute__((unavailable));
+ (instancetype)numberWithDouble:(double)value __attribute__((unavailable));
+ (instancetype)numberWithBool:(BOOL)value __attribute__((unavailable));
+ (instancetype)numberWithInteger:(NSInteger)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
@end

__attribute__((swift_name("KotlinByte")))
@interface MsdkCoreByte : MsdkCoreNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end

__attribute__((swift_name("KotlinUByte")))
@interface MsdkCoreUByte : MsdkCoreNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end

__attribute__((swift_name("KotlinShort")))
@interface MsdkCoreShort : MsdkCoreNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end

__attribute__((swift_name("KotlinUShort")))
@interface MsdkCoreUShort : MsdkCoreNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end

__attribute__((swift_name("KotlinInt")))
@interface MsdkCoreInt : MsdkCoreNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end

__attribute__((swift_name("KotlinUInt")))
@interface MsdkCoreUInt : MsdkCoreNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end

__attribute__((swift_name("KotlinLong")))
@interface MsdkCoreLong : MsdkCoreNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end

__attribute__((swift_name("KotlinULong")))
@interface MsdkCoreULong : MsdkCoreNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end

__attribute__((swift_name("KotlinFloat")))
@interface MsdkCoreFloat : MsdkCoreNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end

__attribute__((swift_name("KotlinDouble")))
@interface MsdkCoreDouble : MsdkCoreNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end

__attribute__((swift_name("KotlinBoolean")))
@interface MsdkCoreBoolean : MsdkCoreNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApplicationInfo")))
@interface MsdkCoreApplicationInfo : MsdkCoreBase
- (instancetype)initWithVersion:(NSString * _Nullable)version bundleId:(NSString * _Nullable)bundleId appName:(NSString * _Nullable)appName __attribute__((swift_name("init(version:bundleId:appName:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString * _Nullable appName __attribute__((swift_name("appName")));
@property (readonly) NSString * _Nullable bundleId __attribute__((swift_name("bundleId")));
@property (readonly) NSString * _Nullable version __attribute__((swift_name("version")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeviceScreenResolutionInfo")))
@interface MsdkCoreDeviceScreenResolutionInfo : MsdkCoreBase
- (instancetype)initWithWidth:(int32_t)width height:(int32_t)height __attribute__((swift_name("init(width:height:)"))) __attribute__((objc_designated_initializer));
@property (readonly) int32_t height __attribute__((swift_name("height")));
@property (readonly) int32_t width __attribute__((swift_name("width")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreMetadata")))
@interface MsdkCoreMSDKCoreMetadata : MsdkCoreBase
- (instancetype)initWithVersion:(NSString *)version __attribute__((swift_name("init(version:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString *version __attribute__((swift_name("version")));
@end

__attribute__((swift_name("Cancellable")))
@protocol MsdkCoreCancellable
@required
- (void)cancel __attribute__((swift_name("cancel()")));
@end


/**
 * This object provides complete flow for payment page process.
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreSession")))
@interface MsdkCoreMSDKCoreSession : MsdkCoreBase <MsdkCoreCancellable>
- (instancetype)initWithConfig:(MsdkCoreMSDKCoreSessionConfig *)config __attribute__((swift_name("init(config:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreMSDKCoreSessionCompanion *companion __attribute__((swift_name("companion")));

/**
 * clear session
 */
- (void)cancel __attribute__((swift_name("cancel()")));

/**
 * Remove saved card flow
 * @return  [CardRemoveInteractor][com.paymentpage.msdk.core.domain.interactors.card.remove.CardRemoveInteractor]
 */
- (MsdkCoreCardRemoveInteractor *)getCardRemoveInteractor __attribute__((swift_name("getCardRemoveInteractor()")));

/**
 * current Payment object
 */
- (MsdkCorePayment * _Nullable)getCurrentPayment __attribute__((swift_name("getCurrentPayment()")));

/**
 * send error events to analytics report
 */
- (MsdkCoreErrorEventInteractor *)getErrorEventInteractor __attribute__((swift_name("getErrorEventInteractor()")));

/**
 * Initialise payment process
 * @return  [CardRemoveInteractor][com.paymentpage.msdk.core.domain.interactors.card.remove.CardRemoveInteractor]
 */
- (MsdkCoreInitInteractor *)getInitInteractor __attribute__((swift_name("getInitInteractor()")));

/**
 * Sale with new card flow
 * @return  [PayInteractor][com.paymentpage.msdk.core.domain.interactors.pay.PayInteractor]
 */
- (MsdkCorePayInteractor *)getPayInteractor __attribute__((swift_name("getPayInteractor()")));

/**
 * Payment info
 */
- (MsdkCorePaymentInfo * _Nullable)getPaymentInfo __attribute__((swift_name("getPaymentInfo()")));

/**
 * Payment methods from init request
 */
- (NSArray<MsdkCorePaymentMethod *> * _Nullable)getPaymentMethods __attribute__((swift_name("getPaymentMethods()")));

/**
 * Saved accounts methods from init request
 */
- (NSArray<MsdkCoreSavedAccount *> * _Nullable)getSavedAccounts __attribute__((swift_name("getSavedAccounts()")));

/**
 * Secure logo manager for received strings from server
 * @return  [SecureLogoResourceManager][com.paymentpage.msdk.core.manager.resource.logo.SecureLogoResourceManager]
 */
- (id<MsdkCoreSecureLogoResourceManager>)getSecureLogoResourceManager __attribute__((swift_name("getSecureLogoResourceManager()")));
- (MsdkCoreKotlinx_serialization_jsonJson *)getSerializer __attribute__((swift_name("getSerializer()")));

/**
 * String manager for received strings from server
 * @return  [StringResourceManager][com.paymentpage.msdk.core.manager.resource.strings.StringResourceManager]
 */
- (id<MsdkCoreStringResourceManager>)getStringResourceManager __attribute__((swift_name("getStringResourceManager()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreSession.Companion")))
@interface MsdkCoreMSDKCoreSessionCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreMSDKCoreSessionCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreMSDKCoreMetadata *metadata __attribute__((swift_name("metadata")));
@end


/**
 * Configuration of current sdk session
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreSessionConfig")))
@interface MsdkCoreMSDKCoreSessionConfig : MsdkCoreBase
- (instancetype)initWithApiHost:(NSString *)apiHost wsApiHost:(NSString *)wsApiHost isDebug:(BOOL)isDebug mockConfig:(MsdkCoreMSDKCoreMockConfig * _Nullable)mockConfig __attribute__((swift_name("init(apiHost:wsApiHost:isDebug:mockConfig:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreMSDKCoreSessionConfigCompanion *companion __attribute__((swift_name("companion")));

/**
 * host for http requests
 */
@property (readonly) NSString *apiHost __attribute__((swift_name("apiHost")));

/**
 * set or disable debug mode (disable/enable console log)
 */
@property (readonly) BOOL isDebug __attribute__((swift_name("isDebug")));

/**
 * set or disable mock mode (without network requests)
 */
@property (readonly) MsdkCoreMSDKCoreMockConfig * _Nullable mockConfig __attribute__((swift_name("mockConfig")));
@property MsdkCoreUserAgentData * _Nullable userAgentData __attribute__((swift_name("userAgentData")));

/**
 * host for ws socket
 */
@property (readonly) NSString *wsApiHost __attribute__((swift_name("wsApiHost")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreSessionConfig.Companion")))
@interface MsdkCoreMSDKCoreSessionConfigCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreMSDKCoreSessionConfigCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreMSDKCoreSessionConfig *)debugApiHost:(NSString *)apiHost wsApiHost:(NSString *)wsApiHost __attribute__((swift_name("debug(apiHost:wsApiHost:)")));
- (MsdkCoreMSDKCoreSessionConfig *)mockMockConfig:(MsdkCoreMSDKCoreMockConfig *)mockConfig __attribute__((swift_name("mock(mockConfig:)")));

/**
 * Full payment flow with decline result
 */
- (MsdkCoreMSDKCoreSessionConfig *)mockFullDeclineFlowDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("mockFullDeclineFlow(duration:)")));

/**
 * Full payment flow with success result
 */
- (MsdkCoreMSDKCoreSessionConfig *)mockFullSuccessFlowDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("mockFullSuccessFlow(duration:)")));
- (MsdkCoreMSDKCoreSessionConfig *)releaseApiHost:(NSString *)apiHost wsApiHost:(NSString *)wsApiHost __attribute__((swift_name("release(apiHost:wsApiHost:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UserAgentData")))
@interface MsdkCoreUserAgentData : MsdkCoreBase
- (instancetype)initWithScreenInfo:(MsdkCoreDeviceScreenResolutionInfo * _Nullable)screenInfo applicationInfo:(MsdkCoreApplicationInfo * _Nullable)applicationInfo __attribute__((swift_name("init(screenInfo:applicationInfo:)"))) __attribute__((objc_designated_initializer));
@property (readonly) MsdkCoreApplicationInfo * _Nullable applicationInfo __attribute__((swift_name("applicationInfo")));
@property (readonly) MsdkCoreDeviceScreenResolutionInfo * _Nullable screenInfo __attribute__((swift_name("screenInfo")));
@end

__attribute__((swift_name("KotlinComparable")))
@protocol MsdkCoreKotlinComparable
@required
- (int32_t)compareToOther:(id _Nullable)other __attribute__((swift_name("compareTo(other:)")));
@end

__attribute__((swift_name("KotlinEnum")))
@interface MsdkCoreKotlinEnum<E> : MsdkCoreBase <MsdkCoreKotlinComparable>
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKotlinEnumCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)compareToOther:(E)other __attribute__((swift_name("compareTo(other:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) int32_t ordinal __attribute__((swift_name("ordinal")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ErrorCode")))
@interface MsdkCoreErrorCode : MsdkCoreKotlinEnum<MsdkCoreErrorCode *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreErrorCodeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreErrorCode *serverUnauthorized __attribute__((swift_name("serverUnauthorized")));
@property (class, readonly) MsdkCoreErrorCode *serverMethodNotFound __attribute__((swift_name("serverMethodNotFound")));
@property (class, readonly) MsdkCoreErrorCode *serverApiError __attribute__((swift_name("serverApiError")));
@property (class, readonly) MsdkCoreErrorCode *serverContentParsingError __attribute__((swift_name("serverContentParsingError")));
@property (class, readonly) MsdkCoreErrorCode *networkError __attribute__((swift_name("networkError")));
@property (class, readonly) MsdkCoreErrorCode *networkIsNotAvailable __attribute__((swift_name("networkIsNotAvailable")));
@property (class, readonly) MsdkCoreErrorCode *networkTimeout __attribute__((swift_name("networkTimeout")));
@property (class, readonly) MsdkCoreErrorCode *paymentRequestTypeNotExist __attribute__((swift_name("paymentRequestTypeNotExist")));
@property (class, readonly) MsdkCoreErrorCode *paymentMethodNotAvailable __attribute__((swift_name("paymentMethodNotAvailable")));
@property (class, readonly) MsdkCoreErrorCode *paymentAlreadyExist __attribute__((swift_name("paymentAlreadyExist")));
@property (class, readonly) MsdkCoreErrorCode *paymentHasFinalStatus __attribute__((swift_name("paymentHasFinalStatus")));
@property (class, readonly) MsdkCoreErrorCode *paymentNotFound __attribute__((swift_name("paymentNotFound")));
@property (class, readonly) MsdkCoreErrorCode *paymentTokenNotExist __attribute__((swift_name("paymentTokenNotExist")));
@property (class, readonly) MsdkCoreErrorCode *customerIdNotExist __attribute__((swift_name("customerIdNotExist")));
@property (class, readonly) MsdkCoreErrorCode *clarificationFieldsError __attribute__((swift_name("clarificationFieldsError")));
@property (class, readonly) MsdkCoreErrorCode *sessionNotInitialized __attribute__((swift_name("sessionNotInitialized")));
@property (class, readonly) MsdkCoreErrorCode *illegalArguments __attribute__((swift_name("illegalArguments")));
@property (class, readonly) MsdkCoreErrorCode *illegalState __attribute__((swift_name("illegalState")));
@property (class, readonly) MsdkCoreErrorCode *unknown __attribute__((swift_name("unknown")));
+ (MsdkCoreKotlinArray<MsdkCoreErrorCode *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreErrorCode *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString * _Nullable exceptionName __attribute__((swift_name("exceptionName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ErrorCode.Companion")))
@interface MsdkCoreErrorCodeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreErrorCodeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreErrorCode *)fromExceptionName:(NSString *)exceptionName __attribute__((swift_name("from(exceptionName:)")));
- (MsdkCoreErrorCode *)fromException:(MsdkCoreKotlinThrowable *)exception __attribute__((swift_name("from(exception:)")));
@end

__attribute__((swift_name("Request")))
@interface MsdkCoreRequest : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApiLinkMessage")))
@interface MsdkCoreApiLinkMessage : MsdkCoreBase
- (instancetype)initWithMessage:(NSString * _Nullable)message links:(NSArray<MsdkCoreApiLinkMessageLink *> * _Nullable)links __attribute__((swift_name("init(message:links:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreApiLinkMessageCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreApiLinkMessage *)doCopyMessage:(NSString * _Nullable)message links:(NSArray<MsdkCoreApiLinkMessageLink *> * _Nullable)links __attribute__((swift_name("doCopy(message:links:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSArray<MsdkCoreApiLinkMessageLink *> * _Nullable links __attribute__((swift_name("links")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApiLinkMessage.Companion")))
@interface MsdkCoreApiLinkMessageCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreApiLinkMessageCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApiLinkMessageLink")))
@interface MsdkCoreApiLinkMessageLink : MsdkCoreBase
- (instancetype)initWithUrl:(NSString * _Nullable)url messageLink:(NSString * _Nullable)messageLink __attribute__((swift_name("init(url:messageLink:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreApiLinkMessageLinkCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreApiLinkMessageLink *)doCopyUrl:(NSString * _Nullable)url messageLink:(NSString * _Nullable)messageLink __attribute__((swift_name("doCopy(url:messageLink:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString * _Nullable messageLink __attribute__((swift_name("messageLink")));
@property (readonly) NSString * _Nullable url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApiLinkMessageLink.Companion")))
@interface MsdkCoreApiLinkMessageLinkCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreApiLinkMessageLinkCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardDate")))
@interface MsdkCoreCardDate : MsdkCoreBase
- (instancetype)initWithMonth:(int32_t)month year:(int32_t)year __attribute__((swift_name("init(month:year:)"))) __attribute__((objc_designated_initializer));
@property (readonly) int32_t month __attribute__((swift_name("month")));
@property (readonly) int32_t year __attribute__((swift_name("year")));
@end


/**
 * Payment configuration
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("PaymentInfo")))
@interface MsdkCorePaymentInfo : MsdkCoreBase
- (instancetype)initWithProjectId:(int32_t)projectId paymentId:(NSString *)paymentId paymentAmount:(int64_t)paymentAmount paymentCurrency:(NSString *)paymentCurrency paymentDescription:(NSString * _Nullable)paymentDescription customerId:(NSString * _Nullable)customerId regionCode:(NSString * _Nullable)regionCode token:(NSString * _Nullable)token languageCode:(NSString * _Nullable)languageCode receiptData:(NSString * _Nullable)receiptData threeDSecureInfo:(MsdkCoreThreeDSecureInfo * _Nullable)threeDSecureInfo hideSavedWallets:(BOOL)hideSavedWallets forcePaymentMethod:(NSString * _Nullable)forcePaymentMethod signature:(NSString * _Nullable)signature __attribute__((swift_name("init(projectId:paymentId:paymentAmount:paymentCurrency:paymentDescription:customerId:regionCode:token:languageCode:receiptData:threeDSecureInfo:hideSavedWallets:forcePaymentMethod:signature:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCorePaymentInfoCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)getParamsForSignature __attribute__((swift_name("getParamsForSignature()")));
@property NSString * _Nullable customerId __attribute__((swift_name("customerId")));

/**
 * the identifier of the payment method which is opened to the customer without an option for the customer to select another payment method. The list of codes is provided in the IDs of payment methods supported on Payment Page section
 */
@property NSString * _Nullable forcePaymentMethod __attribute__((swift_name("forcePaymentMethod")));

/**
 * hiding or displaying saved payment instruments in the payment form
 */
@property BOOL hideSavedWallets __attribute__((swift_name("hideSavedWallets")));
@property NSString * _Nullable languageCode __attribute__((swift_name("languageCode")));

/**
 * payment amount in minor currency units
 */
@property (readonly) int64_t paymentAmount __attribute__((swift_name("paymentAmount")));

/**
 * payment currency code according to ISO-4217 alpha-3
 */
@property (readonly) NSString *paymentCurrency __attribute__((swift_name("paymentCurrency")));

/**
 * payment description (this parameter is available not only to the merchant, but also to the customer; if paymentDescription is specified in the request, it is visible to the customer in the payment form (in the dialog box containing information about the payment); if this parameter is not specified in the request, it is not visible to the customer)
 */
@property NSString * _Nullable paymentDescription __attribute__((swift_name("paymentDescription")));

/**
 * must be unique within the project
 */
@property (readonly) NSString *paymentId __attribute__((swift_name("paymentId")));

/**
 * project (merchant) ID
 */
@property (readonly) int32_t projectId __attribute__((swift_name("projectId")));
@property NSString * _Nullable receiptData __attribute__((swift_name("receiptData")));

/**
 * customer country
 */
@property NSString * _Nullable regionCode __attribute__((swift_name("regionCode")));
@property NSString * _Nullable signature __attribute__((swift_name("signature")));
@property MsdkCoreThreeDSecureInfo * _Nullable threeDSecureInfo __attribute__((swift_name("threeDSecureInfo")));

/**
 * card token
 */
@property NSString * _Nullable token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentInfo.Companion")))
@interface MsdkCorePaymentInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCorePaymentInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCorePaymentInfo *)createProjectId:(int32_t)projectId paymentId:(NSString *)paymentId paymentAmount:(int64_t)paymentAmount paymentCurrency:(NSString *)paymentCurrency __attribute__((swift_name("create(projectId:paymentId:paymentAmount:paymentCurrency:)")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RecipientInfo")))
@interface MsdkCoreRecipientInfo : MsdkCoreBase
- (instancetype)initWithWalletOwner:(NSString * _Nullable)walletOwner walletId:(NSString * _Nullable)walletId country:(NSString * _Nullable)country pan:(NSString * _Nullable)pan cardHolder:(NSString * _Nullable)cardHolder address:(NSString * _Nullable)address city:(NSString * _Nullable)city stateCode:(NSString * _Nullable)stateCode firstName:(NSString * _Nullable)firstName lastName:(NSString * _Nullable)lastName __attribute__((swift_name("init(walletOwner:walletId:country:pan:cardHolder:address:city:stateCode:firstName:lastName:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreRecipientInfoCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable address __attribute__((swift_name("address")));
@property (readonly) NSString * _Nullable cardHolder __attribute__((swift_name("cardHolder")));
@property (readonly) NSString * _Nullable city __attribute__((swift_name("city")));
@property (readonly) NSString * _Nullable country __attribute__((swift_name("country")));
@property (readonly) NSString * _Nullable firstName __attribute__((swift_name("firstName")));
@property (readonly) NSString * _Nullable lastName __attribute__((swift_name("lastName")));
@property (readonly) NSString * _Nullable pan __attribute__((swift_name("pan")));
@property (readonly) NSString * _Nullable stateCode __attribute__((swift_name("stateCode")));
@property (readonly) NSString * _Nullable walletId __attribute__((swift_name("walletId")));
@property (readonly) NSString * _Nullable walletOwner __attribute__((swift_name("walletOwner")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RecipientInfo.Companion")))
@interface MsdkCoreRecipientInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreRecipientInfoCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * Object with the details of COF payment
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("RecurrentInfo")))
@interface MsdkCoreRecurrentInfo : MsdkCoreBase
- (instancetype)initWithRegister:(BOOL)register_ type:(NSString * _Nullable)type expiryDay:(NSString * _Nullable)expiryDay expiryMonth:(NSString * _Nullable)expiryMonth expiryYear:(NSString * _Nullable)expiryYear period:(NSString * _Nullable)period interval:(MsdkCoreInt * _Nullable)interval time:(NSString * _Nullable)time startDate:(NSString * _Nullable)startDate scheduledPaymentID:(NSString * _Nullable)scheduledPaymentID amount:(MsdkCoreLong * _Nullable)amount schedule:(NSArray<MsdkCoreRecurrentInfoSchedule *> * _Nullable)schedule __attribute__((swift_name("init(register:type:expiryDay:expiryMonth:expiryYear:period:interval:time:startDate:scheduledPaymentID:amount:schedule:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreRecurrentInfoCompanion *companion __attribute__((swift_name("companion")));

/**
 * Amount of COF purchase. By default the amount of COF purchase is equal to payment amount
 */
@property (readonly) MsdkCoreLong * _Nullable amount __attribute__((swift_name("amount")));

/**
 *  Day of recurrent expiration, must be string(2) day in DD format
 */
@property (readonly) NSString * _Nullable expiryDay __attribute__((swift_name("expiryDay")));

/**
 * Month of recurrent expiration, must be string(2) month in MM format
 */
@property (readonly) NSString * _Nullable expiryMonth __attribute__((swift_name("expiryMonth")));

/**
 *  Year of recurrent expiration, must be string(4) month in YYYY format
 */
@property (readonly) NSString * _Nullable expiryYear __attribute__((swift_name("expiryYear")));

/**
 *  Interval of payment: 1-100
 *  (For example: period = W and interval = 3 - payment is every three weeks)
 */
@property (readonly) MsdkCoreInt * _Nullable interval __attribute__((swift_name("interval")));

/**
 *  Period of payment - Day/Week/Month/Quarter/Year
 */
@property (readonly) NSString * _Nullable period __attribute__((swift_name("period")));
@property (readonly, getter=register) BOOL register_ __attribute__((swift_name("register_")));

/**
 * Data and amount of COF purchase. By default the debit of funds is strictly fixed in time and amount
 */
@property (readonly) NSArray<MsdkCoreRecurrentInfoSchedule *> * _Nullable schedule __attribute__((swift_name("schedule")));

/**
 * Payment ID, must be unique within your project
 */
@property (readonly) NSString * _Nullable scheduledPaymentID __attribute__((swift_name("scheduledPaymentID")));

/**
 * Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
 */
@property (readonly) NSString * _Nullable startDate __attribute__((swift_name("startDate")));

/**
 * Time of recurrent payment to charge
 */
@property (readonly) NSString * _Nullable time __attribute__((swift_name("time")));

/**
 * Type of recurrent - R/C/U/I
 */
@property (readonly) NSString * _Nullable type __attribute__((swift_name("type")));
@end


/**
 * Object with the details of COF payment
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RecurrentInfo.Companion")))
@interface MsdkCoreRecurrentInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));

/**
 * Object with the details of COF payment
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreRecurrentInfoCompanion *shared __attribute__((swift_name("shared")));

/**
 * Object with the details of COF payment
 */
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("RecurrentInfoSchedule")))
@interface MsdkCoreRecurrentInfoSchedule : MsdkCoreBase
- (instancetype)initWithDate:(NSString * _Nullable)date amount:(MsdkCoreLong * _Nullable)amount __attribute__((swift_name("init(date:amount:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreRecurrentInfoScheduleCompanion *companion __attribute__((swift_name("companion")));

/**
 * Amount to charge, 1000 = 10.00
 */
@property (readonly) MsdkCoreLong * _Nullable amount __attribute__((swift_name("amount")));

/**
 *  Date of charge in format DD-MM-YYYY
 */
@property (readonly) NSString * _Nullable date __attribute__((swift_name("date")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RecurrentInfoSchedule.Companion")))
@interface MsdkCoreRecurrentInfoScheduleCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreRecurrentInfoScheduleCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SdkDate")))
@interface MsdkCoreSdkDate : MsdkCoreBase
- (instancetype)initWithText:(NSString *)text __attribute__((swift_name("init(text:)"))) __attribute__((objc_designated_initializer));
- (BOOL)isValid __attribute__((swift_name("isValid()")));
@property (readonly) MsdkCoreInt * _Nullable date __attribute__((swift_name("date")));
@property (readonly) MsdkCoreInt * _Nullable month __attribute__((swift_name("month")));
@property (readonly) NSString *stringValue __attribute__((swift_name("stringValue")));
@property (readonly) MsdkCoreInt * _Nullable year __attribute__((swift_name("year")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SdkExpiry")))
@interface MsdkCoreSdkExpiry : MsdkCoreBase
- (instancetype)initWithText:(NSString *)text __attribute__((swift_name("init(text:)"))) __attribute__((objc_designated_initializer));
- (BOOL)isMoreThanNow __attribute__((swift_name("isMoreThanNow()")));
- (BOOL)isValid __attribute__((swift_name("isValid()")));
@property (readonly) MsdkCoreInt * _Nullable month __attribute__((swift_name("month")));
@property (readonly) NSString *stringValue __attribute__((swift_name("stringValue")));
@property (readonly) MsdkCoreInt * _Nullable year __attribute__((swift_name("year")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ClarificationField")))
@interface MsdkCoreClarificationField : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name validatorName:(NSString * _Nullable)validatorName validator:(id<MsdkCoreValidator> _Nullable)validator defaultLabel:(NSString * _Nullable)defaultLabel defaultHint:(NSString * _Nullable)defaultHint defaultPlaceholder:(NSString * _Nullable)defaultPlaceholder defaultErrorMessage:(NSString * _Nullable)defaultErrorMessage __attribute__((swift_name("init(name:validatorName:validator:defaultLabel:defaultHint:defaultPlaceholder:defaultErrorMessage:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreClarificationFieldCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable defaultErrorMessage __attribute__((swift_name("defaultErrorMessage")));
@property (readonly) NSString * _Nullable defaultHint __attribute__((swift_name("defaultHint")));
@property (readonly) NSString * _Nullable defaultLabel __attribute__((swift_name("defaultLabel")));
@property (readonly) NSString * _Nullable defaultPlaceholder __attribute__((swift_name("defaultPlaceholder")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) id<MsdkCoreValidator> _Nullable validator __attribute__((swift_name("validator")));
@property (readonly) NSString * _Nullable validatorName __attribute__((swift_name("validatorName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ClarificationField.Companion")))
@interface MsdkCoreClarificationFieldCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreClarificationFieldCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreClarificationField *)fromNameName:(NSString *)name __attribute__((swift_name("fromName(name:)")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("ClarificationFieldValue")))
@interface MsdkCoreClarificationFieldValue : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name value:(NSString *)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreClarificationFieldValueCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ClarificationFieldValue.Companion")))
@interface MsdkCoreClarificationFieldValueCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreClarificationFieldValueCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreClarificationFieldValue *)fromNameWithValueName:(NSString *)name value:(NSString *)value __attribute__((swift_name("fromNameWithValue(name:value:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("CompleteField")))
@interface MsdkCoreCompleteField : MsdkCoreBase
- (instancetype)initWithName:(NSString * _Nullable)name defaultLabel:(NSString * _Nullable)defaultLabel value:(NSString * _Nullable)value __attribute__((swift_name("init(name:defaultLabel:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreCompleteFieldCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable defaultLabel __attribute__((swift_name("defaultLabel")));
@property (readonly) NSString * _Nullable name __attribute__((swift_name("name")));
@property NSString * _Nullable value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CompleteField.Companion")))
@interface MsdkCoreCompleteFieldCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreCompleteFieldCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreCompleteField *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomerField")))
@interface MsdkCoreCustomerField : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name isRequired:(BOOL)isRequired isHidden:(BOOL)isHidden isTokenize:(BOOL)isTokenize serverType:(MsdkCoreFieldServerType *)serverType hint:(NSString * _Nullable)hint label:(NSString *)label placeholder:(NSString * _Nullable)placeholder validatorName:(NSString * _Nullable)validatorName validator:(id<MsdkCoreValidator> _Nullable)validator errorMessage:(NSString * _Nullable)errorMessage errorMessageKey:(NSString *)errorMessageKey options:(NSArray<MsdkCoreCustomerFieldOption *> * _Nullable)options __attribute__((swift_name("init(name:isRequired:isHidden:isTokenize:serverType:hint:label:placeholder:validatorName:validator:errorMessage:errorMessageKey:options:)"))) __attribute__((objc_designated_initializer));
- (MsdkCoreCustomerField *)doCopyName:(NSString *)name isRequired:(BOOL)isRequired isHidden:(BOOL)isHidden isTokenize:(BOOL)isTokenize serverType:(MsdkCoreFieldServerType *)serverType hint:(NSString * _Nullable)hint label:(NSString *)label placeholder:(NSString * _Nullable)placeholder validatorName:(NSString * _Nullable)validatorName validator:(id<MsdkCoreValidator> _Nullable)validator errorMessage:(NSString * _Nullable)errorMessage errorMessageKey:(NSString *)errorMessageKey options:(NSArray<MsdkCoreCustomerFieldOption *> * _Nullable)options __attribute__((swift_name("doCopy(name:isRequired:isHidden:isTokenize:serverType:hint:label:placeholder:validatorName:validator:errorMessage:errorMessageKey:options:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString * _Nullable errorMessage __attribute__((swift_name("errorMessage")));
@property (readonly) NSString *errorMessageKey __attribute__((swift_name("errorMessageKey")));
@property (readonly) NSString * _Nullable hint __attribute__((swift_name("hint")));
@property (readonly) BOOL isHidden __attribute__((swift_name("isHidden")));
@property (readonly) BOOL isRequired __attribute__((swift_name("isRequired")));
@property (readonly) BOOL isTokenize __attribute__((swift_name("isTokenize")));
@property (readonly) NSString *label __attribute__((swift_name("label")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSArray<MsdkCoreCustomerFieldOption *> * _Nullable options __attribute__((swift_name("options")));
@property (readonly) NSString * _Nullable placeholder __attribute__((swift_name("placeholder")));
@property (readonly) MsdkCoreFieldServerType *serverType __attribute__((swift_name("serverType")));
@property (readonly) id<MsdkCoreValidator> _Nullable validator __attribute__((swift_name("validator")));
@property (readonly) NSString * _Nullable validatorName __attribute__((swift_name("validatorName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomerFieldOption")))
@interface MsdkCoreCustomerFieldOption : MsdkCoreBase
- (instancetype)initWithName:(NSString * _Nullable)name value:(NSString * _Nullable)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreCustomerFieldOptionCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable name __attribute__((swift_name("name")));
@property (readonly) NSString * _Nullable value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomerFieldOption.Companion")))
@interface MsdkCoreCustomerFieldOptionCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreCustomerFieldOptionCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreCustomerFieldOption *)fromNameWithValueName:(NSString *)name value:(NSString *)value __attribute__((swift_name("fromNameWithValue(name:value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomerFieldValue")))
@interface MsdkCoreCustomerFieldValue : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name value:(NSString *)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreCustomerFieldValueCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomerFieldValue.Companion")))
@interface MsdkCoreCustomerFieldValueCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreCustomerFieldValueCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreCustomerFieldValue *)fromNameWithValueName:(NSString *)name value:(NSString *)value __attribute__((swift_name("fromNameWithValue(name:value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FieldServerType")))
@interface MsdkCoreFieldServerType : MsdkCoreKotlinEnum<MsdkCoreFieldServerType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreFieldServerTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreFieldServerType *text __attribute__((swift_name("text")));
@property (class, readonly) MsdkCoreFieldServerType *tel __attribute__((swift_name("tel")));
@property (class, readonly) MsdkCoreFieldServerType *password __attribute__((swift_name("password")));
@property (class, readonly) MsdkCoreFieldServerType *file __attribute__((swift_name("file")));
@property (class, readonly) MsdkCoreFieldServerType *textarea __attribute__((swift_name("textarea")));
@property (class, readonly) MsdkCoreFieldServerType *number __attribute__((swift_name("number")));
@property (class, readonly) MsdkCoreFieldServerType *search __attribute__((swift_name("search")));
@property (class, readonly) MsdkCoreFieldServerType *url __attribute__((swift_name("url")));
@property (class, readonly) MsdkCoreFieldServerType *email __attribute__((swift_name("email")));
@property (class, readonly) MsdkCoreFieldServerType *date __attribute__((swift_name("date")));
+ (MsdkCoreKotlinArray<MsdkCoreFieldServerType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreFieldServerType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FieldServerType.Companion")))
@interface MsdkCoreFieldServerTypeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreFieldServerTypeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreFieldServerType *)fromType:(NSString *)type __attribute__((swift_name("from(type:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentFieldValue")))
@interface MsdkCorePaymentFieldValue : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name value:(NSString *)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCorePaymentFieldValueCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentFieldValue.Companion")))
@interface MsdkCorePaymentFieldValueCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCorePaymentFieldValueCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCorePaymentFieldValue *)fromNameWithValueName:(NSString *)name value:(NSString *)value __attribute__((swift_name("fromNameWithValue(name:value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SenderFieldValue")))
@interface MsdkCoreSenderFieldValue : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name value:(NSString *)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreSenderFieldValueCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SenderFieldValue.Companion")))
@interface MsdkCoreSenderFieldValueCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreSenderFieldValueCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreSenderFieldValue *)fromNameWithValueName:(NSString *)name value:(NSString *)value __attribute__((swift_name("fromNameWithValue(name:value:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("Account")))
@interface MsdkCoreAccount : MsdkCoreBase
- (instancetype)initWithId:(int64_t)id number:(NSString * _Nullable)number type:(NSString * _Nullable)type cardHolder:(NSString * _Nullable)cardHolder expiryMonth:(NSString * _Nullable)expiryMonth expiryYear:(NSString * _Nullable)expiryYear __attribute__((swift_name("init(id:number:type:cardHolder:expiryMonth:expiryYear:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreAccountFactory *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable cardHolder __attribute__((swift_name("cardHolder")));
@property (readonly) NSString * _Nullable expiryMonth __attribute__((swift_name("expiryMonth")));
@property (readonly) NSString * _Nullable expiryYear __attribute__((swift_name("expiryYear")));
@property (readonly) int64_t id __attribute__((swift_name("id")));
@property (readonly) NSString * _Nullable number __attribute__((swift_name("number")));
@property (readonly) NSString * _Nullable type __attribute__((swift_name("type")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Account.Factory")))
@interface MsdkCoreAccountFactory : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)factory __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreAccountFactory *shared __attribute__((swift_name("shared")));
- (MsdkCoreAccount *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * Payment method item, received from server
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentMethod")))
@interface MsdkCorePaymentMethod : MsdkCoreBase
- (instancetype)initWithWalletModeAsk:(BOOL)walletModeAsk walletSaveMode:(MsdkCoreWalletSaveMode *)walletSaveMode code:(NSString *)code name:(NSString * _Nullable)name translations:(NSDictionary<NSString *, NSString *> *)translations isVatInfo:(BOOL)isVatInfo paymentUrl:(NSString * _Nullable)paymentUrl iconUrl:(NSString * _Nullable)iconUrl customerFields:(NSArray<MsdkCoreCustomerField *> *)customerFields cardTypesManager:(MsdkCoreCardTypesManager * _Nullable)cardTypesManager availableCardTypes:(NSArray<NSString *> *)availableCardTypes paymentMethodType:(MsdkCorePaymentMethodType *)paymentMethodType __attribute__((swift_name("init(walletModeAsk:walletSaveMode:code:name:translations:isVatInfo:paymentUrl:iconUrl:customerFields:cardTypesManager:availableCardTypes:paymentMethodType:)"))) __attribute__((objc_designated_initializer));

/**
 * Payment method item, received from server
 */
- (MsdkCorePaymentMethod *)doCopyWalletModeAsk:(BOOL)walletModeAsk walletSaveMode:(MsdkCoreWalletSaveMode *)walletSaveMode code:(NSString *)code name:(NSString * _Nullable)name translations:(NSDictionary<NSString *, NSString *> *)translations isVatInfo:(BOOL)isVatInfo paymentUrl:(NSString * _Nullable)paymentUrl iconUrl:(NSString * _Nullable)iconUrl customerFields:(NSArray<MsdkCoreCustomerField *> *)customerFields cardTypesManager:(MsdkCoreCardTypesManager * _Nullable)cardTypesManager availableCardTypes:(NSArray<NSString *> *)availableCardTypes paymentMethodType:(MsdkCorePaymentMethodType *)paymentMethodType __attribute__((swift_name("doCopy(walletModeAsk:walletSaveMode:code:name:translations:isVatInfo:paymentUrl:iconUrl:customerFields:cardTypesManager:availableCardTypes:paymentMethodType:)")));

/**
 * Payment method item, received from server
 */
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));

/**
 * Payment method item, received from server
 */
- (NSUInteger)hash __attribute__((swift_name("hash()")));

/**
 * Payment method item, received from server
 */
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * Card types, which available for project
 */
@property (readonly) NSArray<NSString *> *availableCardTypes __attribute__((swift_name("availableCardTypes")));

/**
 * Manager, wich can help to detect card type by PAN (available only for card payment method)
 */
@property (readonly) MsdkCoreCardTypesManager * _Nullable cardTypesManager __attribute__((swift_name("cardTypesManager")));

/**
 * Unique code, like 'card'
 */
@property (readonly) NSString *code __attribute__((swift_name("code")));

/**
 * List of customer fields, are available for method
 */
@property (readonly) NSArray<MsdkCoreCustomerField *> *customerFields __attribute__((swift_name("customerFields")));

/**
 * Logo for payment method
 */
@property (readonly) NSString * _Nullable iconUrl __attribute__((swift_name("iconUrl")));

/**
 * Is VAT option enabled
 */
@property (readonly) BOOL isVatInfo __attribute__((swift_name("isVatInfo")));

/**
 * Name of method
 */
@property (readonly) NSString * _Nullable name __attribute__((swift_name("name")));

/**
 * Type of payment method
 */
@property (readonly) MsdkCorePaymentMethodType *paymentMethodType __attribute__((swift_name("paymentMethodType")));

/**
 * Need for non native payment methods, which showed in WebView
 */
@property (readonly) NSString * _Nullable paymentUrl __attribute__((swift_name("paymentUrl")));

/**
 * Strings for payment method
 */
@property (readonly) NSDictionary<NSString *, NSString *> *translations __attribute__((swift_name("translations")));

/**
 * Mode of showing save card
 */
@property (readonly) BOOL walletModeAsk __attribute__((swift_name("walletModeAsk"))) __attribute__((deprecated("Better using walletSaveMode param, because it's more flexible")));

/**
 * Mode of showing save card:
 */
@property (readonly) MsdkCoreWalletSaveMode *walletSaveMode __attribute__((swift_name("walletSaveMode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentMethodBanks")))
@interface MsdkCorePaymentMethodBanks : MsdkCoreBase
- (instancetype)initWithId:(MsdkCoreInt * _Nullable)id name:(NSString * _Nullable)name logo:(NSString * _Nullable)logo nativeName:(NSString * _Nullable)nativeName __attribute__((swift_name("init(id:name:logo:nativeName:)"))) __attribute__((objc_designated_initializer));
@property (readonly) MsdkCoreInt * _Nullable id __attribute__((swift_name("id")));
@property (readonly) NSString * _Nullable logo __attribute__((swift_name("logo")));
@property (readonly) NSString * _Nullable name __attribute__((swift_name("name")));
@property (readonly) NSString * _Nullable nativeName __attribute__((swift_name("nativeName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentMethodCard")))
@interface MsdkCorePaymentMethodCard : MsdkCoreBase
- (instancetype)initWithCode:(NSString * _Nullable)code regExp:(NSString * _Nullable)regExp minLength:(MsdkCoreInt * _Nullable)minLength maxLength:(MsdkCoreInt * _Nullable)maxLength __attribute__((swift_name("init(code:regExp:minLength:maxLength:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString * _Nullable code __attribute__((swift_name("code")));
@property (readonly) MsdkCoreInt * _Nullable maxLength __attribute__((swift_name("maxLength")));
@property (readonly) MsdkCoreInt * _Nullable minLength __attribute__((swift_name("minLength")));
@property (readonly) NSString * _Nullable regExp __attribute__((swift_name("regExp")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentMethodType")))
@interface MsdkCorePaymentMethodType : MsdkCoreKotlinEnum<MsdkCorePaymentMethodType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCorePaymentMethodTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCorePaymentMethodType *card __attribute__((swift_name("card")));
@property (class, readonly) MsdkCorePaymentMethodType *googlePay __attribute__((swift_name("googlePay")));
@property (class, readonly) MsdkCorePaymentMethodType *applePay __attribute__((swift_name("applePay")));
@property (class, readonly) MsdkCorePaymentMethodType *aps __attribute__((swift_name("aps")));
+ (MsdkCoreKotlinArray<MsdkCorePaymentMethodType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCorePaymentMethodType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentMethodType.Companion")))
@interface MsdkCorePaymentMethodTypeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCorePaymentMethodTypeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCorePaymentMethodType *)fromCode:(NSString * _Nullable)code __attribute__((swift_name("from(code:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SavedAccount")))
@interface MsdkCoreSavedAccount : MsdkCoreBase
- (instancetype)initWithId:(int64_t)id number:(NSString * _Nullable)number type:(NSString * _Nullable)type token:(NSString * _Nullable)token cardExpiry:(MsdkCoreSdkExpiry * _Nullable)cardExpiry cardType:(NSString * _Nullable)cardType __attribute__((swift_name("init(id:number:type:token:cardExpiry:cardType:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreSavedAccountCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) MsdkCoreSdkExpiry * _Nullable cardExpiry __attribute__((swift_name("cardExpiry")));
@property (readonly) NSString * _Nullable cardType __attribute__((swift_name("cardType")));
@property (readonly) int64_t id __attribute__((swift_name("id")));
@property (readonly) NSString * _Nullable number __attribute__((swift_name("number")));
@property (readonly) NSString * _Nullable token __attribute__((swift_name("token")));
@property (readonly) NSString * _Nullable type __attribute__((swift_name("type")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SavedAccount.Companion")))
@interface MsdkCoreSavedAccountCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreSavedAccountCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreSavedAccount *)default __attribute__((swift_name("default()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("WalletSaveMode")))
@interface MsdkCoreWalletSaveMode : MsdkCoreKotlinEnum<MsdkCoreWalletSaveMode *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreWalletSaveModeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreWalletSaveMode *neverSaveCustomerPaymentData __attribute__((swift_name("neverSaveCustomerPaymentData")));
@property (class, readonly) MsdkCoreWalletSaveMode *askCustomerBeforeSave __attribute__((swift_name("askCustomerBeforeSave")));
@property (class, readonly) MsdkCoreWalletSaveMode *alwaysSaveCustomerPaymentData __attribute__((swift_name("alwaysSaveCustomerPaymentData")));
+ (MsdkCoreKotlinArray<MsdkCoreWalletSaveMode *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreWalletSaveMode *> *entries __attribute__((swift_name("entries")));
@property (readonly) int32_t value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("WalletSaveMode.Companion")))
@interface MsdkCoreWalletSaveModeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreWalletSaveModeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreWalletSaveMode *)fromValue:(MsdkCoreInt * _Nullable)value __attribute__((swift_name("from(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Link")))
@interface MsdkCoreLink : MsdkCoreBase
- (instancetype)initWithUrl:(NSString * _Nullable)url message:(NSString * _Nullable)message __attribute__((swift_name("init(url:message:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
@property (readonly) NSString * _Nullable url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LinkMessage")))
@interface MsdkCoreLinkMessage : MsdkCoreBase
- (instancetype)initWithMessage:(NSString * _Nullable)message links:(NSArray<MsdkCoreLink *> * _Nullable)links __attribute__((swift_name("init(message:links:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSArray<MsdkCoreLink *> * _Nullable links __attribute__((swift_name("links")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
@end


/**
 * Payment object
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("Payment")))
@interface MsdkCorePayment : MsdkCoreBase
- (instancetype)initWithId:(NSString * _Nullable)id serverStatusName:(NSString * _Nullable)serverStatusName status:(MsdkCorePaymentStatus * _Nullable)status purchase:(NSString * _Nullable)purchase date:(NSString * _Nullable)date method:(NSString * _Nullable)method paymentMethodType:(MsdkCorePaymentMethodType *)paymentMethodType methodName:(NSString * _Nullable)methodName description:(NSString * _Nullable)description account:(MsdkCoreAccount * _Nullable)account sum:(int64_t)sum acs:(MsdkCoreAcs * _Nullable)acs threeds2:(MsdkCoreThreeds2 * _Nullable)threeds2 type:(NSString * _Nullable)type token:(NSString * _Nullable)token clarificationFields:(NSArray<MsdkCoreClarificationField *> * _Nullable)clarificationFields completeFields:(NSArray<MsdkCoreCompleteField *> * _Nullable)completeFields currency:(NSString * _Nullable)currency cascadingWithRedirect:(MsdkCoreBoolean * _Nullable)cascadingWithRedirect projectName:(NSString * _Nullable)projectName recurringId:(MsdkCoreInt * _Nullable)recurringId redirectInfo:(NSString * _Nullable)redirectInfo consentData:(NSArray<MsdkCoreConsentData *> * _Nullable)consentData redirectInfoObject:(MsdkCoreRedirectInfo * _Nullable)redirectInfoObject paymentMassage:(NSString * _Nullable)paymentMassage paymentFlow:(MsdkCorePaymentFlow * _Nullable)paymentFlow __attribute__((swift_name("init(id:serverStatusName:status:purchase:date:method:paymentMethodType:methodName:description:account:sum:acs:threeds2:type:token:clarificationFields:completeFields:currency:cascadingWithRedirect:projectName:recurringId:redirectInfo:consentData:redirectInfoObject:paymentMassage:paymentFlow:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCorePaymentCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) MsdkCoreAccount * _Nullable account __attribute__((swift_name("account")));
@property (readonly) MsdkCoreAcs * _Nullable acs __attribute__((swift_name("acs")));
@property (readonly) MsdkCoreBoolean * _Nullable cascadingWithRedirect __attribute__((swift_name("cascadingWithRedirect")));
@property (readonly) NSArray<MsdkCoreClarificationField *> * _Nullable clarificationFields __attribute__((swift_name("clarificationFields")));
@property (readonly) NSArray<MsdkCoreCompleteField *> * _Nullable completeFields __attribute__((swift_name("completeFields")));
@property (readonly) NSArray<MsdkCoreConsentData *> * _Nullable consentData __attribute__((swift_name("consentData")));
@property (readonly) NSString * _Nullable currency __attribute__((swift_name("currency")));
@property (readonly) NSString * _Nullable date __attribute__((swift_name("date")));
@property (readonly) NSString * _Nullable description_ __attribute__((swift_name("description_")));
@property (readonly) NSString * _Nullable id __attribute__((swift_name("id")));
@property NSString * _Nullable json __attribute__((swift_name("json")));
@property (readonly) NSString * _Nullable method __attribute__((swift_name("method")));
@property (readonly) NSString * _Nullable methodName __attribute__((swift_name("methodName")));
@property (readonly) MsdkCorePaymentFlow * _Nullable paymentFlow __attribute__((swift_name("paymentFlow")));
@property (readonly) NSString * _Nullable paymentMassage __attribute__((swift_name("paymentMassage")));
@property (readonly) MsdkCorePaymentMethodType *paymentMethodType __attribute__((swift_name("paymentMethodType")));
@property (readonly) NSString * _Nullable projectName __attribute__((swift_name("projectName")));
@property (readonly) NSString * _Nullable purchase __attribute__((swift_name("purchase")));
@property (readonly) MsdkCoreInt * _Nullable recurringId __attribute__((swift_name("recurringId")));
@property (readonly) NSString * _Nullable redirectInfo __attribute__((swift_name("redirectInfo")));
@property (readonly) MsdkCoreRedirectInfo * _Nullable redirectInfoObject __attribute__((swift_name("redirectInfoObject")));
@property (readonly) NSString * _Nullable serverStatusName __attribute__((swift_name("serverStatusName")));
@property (readonly) MsdkCorePaymentStatus * _Nullable status __attribute__((swift_name("status")));
@property (readonly) int64_t sum __attribute__((swift_name("sum")));
@property (readonly) MsdkCoreThreeds2 * _Nullable threeds2 __attribute__((swift_name("threeds2")));
@property (readonly) NSString * _Nullable token __attribute__((swift_name("token")));
@property (readonly) NSString * _Nullable type __attribute__((swift_name("type")));
@end


/**
 * Payment object
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Payment.Companion")))
@interface MsdkCorePaymentCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));

/**
 * Payment object
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCorePaymentCompanion *shared __attribute__((swift_name("shared")));

/**
 * Payment object
 */
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentFlow")))
@interface MsdkCorePaymentFlow : MsdkCoreKotlinEnum<MsdkCorePaymentFlow *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) MsdkCorePaymentFlow *success __attribute__((swift_name("success")));
@property (class, readonly) MsdkCorePaymentFlow *fail __attribute__((swift_name("fail")));
@property (class, readonly) MsdkCorePaymentFlow *d3s __attribute__((swift_name("d3s")));
@property (class, readonly) MsdkCorePaymentFlow *processing __attribute__((swift_name("processing")));
@property (class, readonly) MsdkCorePaymentFlow *tryAgain __attribute__((swift_name("tryAgain")));
@property (class, readonly) MsdkCorePaymentFlow *decline __attribute__((swift_name("decline")));
@property (class, readonly) MsdkCorePaymentFlow *clarification __attribute__((swift_name("clarification")));
+ (MsdkCoreKotlinArray<MsdkCorePaymentFlow *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCorePaymentFlow *> *entries __attribute__((swift_name("entries")));
@property (readonly) BOOL isFinal __attribute__((swift_name("isFinal")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentStatus")))
@interface MsdkCorePaymentStatus : MsdkCoreKotlinEnum<MsdkCorePaymentStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCorePaymentStatusCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCorePaymentStatus *processing __attribute__((swift_name("processing")));
@property (class, readonly) MsdkCorePaymentStatus *awaitingRedirectResult __attribute__((swift_name("awaitingRedirectResult")));
@property (class, readonly) MsdkCorePaymentStatus *awaiting3dsResult __attribute__((swift_name("awaiting3dsResult")));
@property (class, readonly) MsdkCorePaymentStatus *awaitingCapture __attribute__((swift_name("awaitingCapture")));
@property (class, readonly) MsdkCorePaymentStatus *canceled __attribute__((swift_name("canceled")));
@property (class, readonly) MsdkCorePaymentStatus *success __attribute__((swift_name("success")));
@property (class, readonly) MsdkCorePaymentStatus *decline __attribute__((swift_name("decline")));
@property (class, readonly) MsdkCorePaymentStatus *awaitingCustomer __attribute__((swift_name("awaitingCustomer")));
@property (class, readonly) MsdkCorePaymentStatus *awaitingClarification __attribute__((swift_name("awaitingClarification")));
@property (class, readonly) MsdkCorePaymentStatus *refundProcessing __attribute__((swift_name("refundProcessing")));
@property (class, readonly) MsdkCorePaymentStatus *reversalProcessing __attribute__((swift_name("reversalProcessing")));
@property (class, readonly) MsdkCorePaymentStatus *refundReversalProcessing __attribute__((swift_name("refundReversalProcessing")));
@property (class, readonly) MsdkCorePaymentStatus *refunded __attribute__((swift_name("refunded")));
@property (class, readonly) MsdkCorePaymentStatus *reversed __attribute__((swift_name("reversed")));
@property (class, readonly) MsdkCorePaymentStatus *partiallyRefunded __attribute__((swift_name("partiallyRefunded")));
@property (class, readonly) MsdkCorePaymentStatus *awaitingConfirmation __attribute__((swift_name("awaitingConfirmation")));
@property (class, readonly) MsdkCorePaymentStatus *unknown __attribute__((swift_name("unknown")));
+ (MsdkCoreKotlinArray<MsdkCorePaymentStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCorePaymentStatus *> *entries __attribute__((swift_name("entries")));
- (MsdkCorePaymentFlow *)groupStatus __attribute__((swift_name("groupStatus()")));
@property (readonly) BOOL isFinal __attribute__((swift_name("isFinal")));
@property (readonly) NSArray<NSString *> *values __attribute__((swift_name("values")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentStatus.Companion")))
@interface MsdkCorePaymentStatusCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCorePaymentStatusCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCorePaymentStatus * _Nullable)fromStatus:(NSString *)status __attribute__((swift_name("from(status:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ConsentData")))
@interface MsdkCoreConsentData : MsdkCoreBase
- (instancetype)initWithName:(NSString * _Nullable)name message:(NSString * _Nullable)message list:(NSArray<NSString *> * _Nullable)list __attribute__((swift_name("init(name:message:list:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreConsentDataCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSArray<NSString *> * _Nullable list __attribute__((swift_name("list")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
@property (readonly) NSString * _Nullable name __attribute__((swift_name("name")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConsentData.Companion")))
@interface MsdkCoreConsentDataCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreConsentDataCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("RedirectInfo")))
@interface MsdkCoreRedirectInfo : MsdkCoreBase
- (instancetype)initWithUrl:(NSString * _Nullable)url method:(NSString * _Nullable)method __attribute__((swift_name("init(url:method:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreRedirectInfoCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable method __attribute__((swift_name("method")));
@property (readonly) NSString * _Nullable url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RedirectInfo.Companion")))
@interface MsdkCoreRedirectInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreRedirectInfoCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StatusResponse")))
@interface MsdkCoreStatusResponse : MsdkCoreBase
- (instancetype)initWithStatus:(NSString * _Nullable)status payment:(MsdkCorePayment *)payment __attribute__((swift_name("init(status:payment:)"))) __attribute__((objc_designated_initializer));
@property (readonly) MsdkCorePayment *payment __attribute__((swift_name("payment")));
@property (readonly) NSString * _Nullable status __attribute__((swift_name("status")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Acs")))
@interface MsdkCoreAcs : MsdkCoreBase
- (instancetype)initWithPaReq:(NSString * _Nullable)paReq acsUrl:(NSString * _Nullable)acsUrl md:(NSString * _Nullable)md termUrl:(NSString * _Nullable)termUrl __attribute__((swift_name("init(paReq:acsUrl:md:termUrl:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreAcsCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable acsUrl __attribute__((swift_name("acsUrl")));
@property (readonly) NSString * _Nullable md __attribute__((swift_name("md")));
@property (readonly) NSString * _Nullable paReq __attribute__((swift_name("paReq")));
@property (readonly) NSString * _Nullable termUrl __attribute__((swift_name("termUrl")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Acs.Companion")))
@interface MsdkCoreAcsCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreAcsCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AcsPage")))
@interface MsdkCoreAcsPage : MsdkCoreBase
- (instancetype)initWithContent:(NSString * _Nullable)content error:(MsdkCoreKotlinThrowable * _Nullable)error errorMessage:(NSString * _Nullable)errorMessage acs:(MsdkCoreAcs * _Nullable)acs returnUrl:(NSString * _Nullable)returnUrl __attribute__((swift_name("init(content:error:errorMessage:acs:returnUrl:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreAcsPageCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) MsdkCoreAcs * _Nullable acs __attribute__((swift_name("acs")));
@property (readonly) NSString * _Nullable content __attribute__((swift_name("content")));
@property (readonly) MsdkCoreKotlinThrowable * _Nullable error __attribute__((swift_name("error")));
@property (readonly) NSString * _Nullable errorMessage __attribute__((swift_name("errorMessage")));
@property (readonly) NSString * _Nullable returnUrl __attribute__((swift_name("returnUrl")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AcsPage.Companion")))
@interface MsdkCoreAcsPageCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreAcsPageCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AcsReturnUrl")))
@interface MsdkCoreAcsReturnUrl : MsdkCoreBase
- (instancetype)initWithReturnUrl:(NSString * _Nullable)returnUrl __attribute__((swift_name("init(returnUrl:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreAcsReturnUrlCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable returnUrl __attribute__((swift_name("returnUrl")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AcsReturnUrl.Companion")))
@interface MsdkCoreAcsReturnUrlCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreAcsReturnUrlCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * object with information about customer account details on record with the web service
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureAccountInfo")))
@interface MsdkCoreThreeDSecureAccountInfo : MsdkCoreBase
- (instancetype)initWithAdditional:(NSString * _Nullable)additional ageIndicator:(NSString * _Nullable)ageIndicator date:(NSString * _Nullable)date changeIndicator:(NSString * _Nullable)changeIndicator changeDate:(NSString * _Nullable)changeDate passChangeIndicator:(NSString * _Nullable)passChangeIndicator passChangeDate:(NSString * _Nullable)passChangeDate purchaseNumber:(MsdkCoreInt * _Nullable)purchaseNumber provisionAttempts:(MsdkCoreInt * _Nullable)provisionAttempts activityDay:(MsdkCoreInt * _Nullable)activityDay activityYear:(MsdkCoreInt * _Nullable)activityYear paymentAgeIndicator:(NSString * _Nullable)paymentAgeIndicator paymentAge:(NSString * _Nullable)paymentAge suspiciousActivity:(NSString * _Nullable)suspiciousActivity authMethod:(NSString * _Nullable)authMethod authTime:(NSString * _Nullable)authTime authData:(NSString * _Nullable)authData __attribute__((swift_name("init(additional:ageIndicator:date:changeIndicator:changeDate:passChangeIndicator:passChangeDate:purchaseNumber:provisionAttempts:activityDay:activityYear:paymentAgeIndicator:paymentAge:suspiciousActivity:authMethod:authTime:authData:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureAccountInfoCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) MsdkCoreInt * _Nullable activityDay __attribute__((swift_name("activityDay")));
@property (readonly) MsdkCoreInt * _Nullable activityYear __attribute__((swift_name("activityYear")));
@property (readonly) NSString * _Nullable additional __attribute__((swift_name("additional")));
@property (readonly) NSString * _Nullable ageIndicator __attribute__((swift_name("ageIndicator")));
@property (readonly) NSString * _Nullable authData __attribute__((swift_name("authData")));
@property (readonly) NSString * _Nullable authMethod __attribute__((swift_name("authMethod")));
@property (readonly) NSString * _Nullable authTime __attribute__((swift_name("authTime")));
@property (readonly) NSString * _Nullable changeDate __attribute__((swift_name("changeDate")));
@property (readonly) NSString * _Nullable changeIndicator __attribute__((swift_name("changeIndicator")));
@property (readonly) NSString * _Nullable date __attribute__((swift_name("date")));
@property (readonly) NSString * _Nullable passChangeDate __attribute__((swift_name("passChangeDate")));
@property (readonly) NSString * _Nullable passChangeIndicator __attribute__((swift_name("passChangeIndicator")));
@property (readonly) NSString * _Nullable paymentAge __attribute__((swift_name("paymentAge")));
@property (readonly) NSString * _Nullable paymentAgeIndicator __attribute__((swift_name("paymentAgeIndicator")));
@property (readonly) MsdkCoreInt * _Nullable provisionAttempts __attribute__((swift_name("provisionAttempts")));
@property (readonly) MsdkCoreInt * _Nullable purchaseNumber __attribute__((swift_name("purchaseNumber")));
@property (readonly) NSString * _Nullable suspiciousActivity __attribute__((swift_name("suspiciousActivity")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureAccountInfo.Companion")))
@interface MsdkCoreThreeDSecureAccountInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureAccountInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureAccountInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * object with information about the customer
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureCustomerInfo")))
@interface MsdkCoreThreeDSecureCustomerInfo : MsdkCoreBase
- (instancetype)initWithAddressMatch:(NSString * _Nullable)addressMatch homePhone:(NSString * _Nullable)homePhone workPhone:(NSString * _Nullable)workPhone billingRegionCode:(NSString * _Nullable)billingRegionCode accountInfo:(MsdkCoreThreeDSecureAccountInfo * _Nullable)accountInfo shippingInfo:(MsdkCoreThreeDSecureShippingInfo * _Nullable)shippingInfo mpiResultInfo:(MsdkCoreThreeDSecureMpiResultInfo * _Nullable)mpiResultInfo __attribute__((swift_name("init(addressMatch:homePhone:workPhone:billingRegionCode:accountInfo:shippingInfo:mpiResultInfo:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureCustomerInfoCompanion *companion __attribute__((swift_name("companion")));

/**
 * object with information about customer account details on record with the web service [ThreeDSecureAccountInfo][com.paymentpage.msdk.core.domain.entities.init.threeDSecure.ThreeDSecureAccountInfo]
 */
@property (readonly) MsdkCoreThreeDSecureAccountInfo * _Nullable accountInfo __attribute__((swift_name("accountInfo")));
@property (readonly) NSString * _Nullable addressMatch __attribute__((swift_name("addressMatch")));
@property (readonly) NSString * _Nullable billingRegionCode __attribute__((swift_name("billingRegionCode")));
@property (readonly) NSString * _Nullable homePhone __attribute__((swift_name("homePhone")));

/**
 * object with information about previous customer authentication  [ThreeDSecureMpiResultInfo][com.paymentpage.msdk.core.domain.entities.init.threeDSecure.ThreeDSecureMpiResultInfo]
 */
@property (readonly) MsdkCoreThreeDSecureMpiResultInfo * _Nullable mpiResultInfo __attribute__((swift_name("mpiResultInfo")));

/**
 * object with shipping details [ThreeDSecureShippingInfo][com.paymentpage.msdk.core.domain.entities.init.threeDSecure.ThreeDSecureShippingInfo]
 */
@property (readonly) MsdkCoreThreeDSecureShippingInfo * _Nullable shippingInfo __attribute__((swift_name("shippingInfo")));
@property (readonly) NSString * _Nullable workPhone __attribute__((swift_name("workPhone")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureCustomerInfo.Companion")))
@interface MsdkCoreThreeDSecureCustomerInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureCustomerInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureCustomerInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureGiftCardInfo")))
@interface MsdkCoreThreeDSecureGiftCardInfo : MsdkCoreBase
- (instancetype)initWithAmount:(MsdkCoreInt * _Nullable)amount currency:(NSString * _Nullable)currency count:(MsdkCoreInt * _Nullable)count __attribute__((swift_name("init(amount:currency:count:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureGiftCardInfoCompanion *companion __attribute__((swift_name("companion")));
- (NSArray<NSString *> *)getParamsForSignature __attribute__((swift_name("getParamsForSignature()")));
@property (readonly) MsdkCoreInt * _Nullable amount __attribute__((swift_name("amount")));
@property (readonly) MsdkCoreInt * _Nullable count __attribute__((swift_name("count")));
@property (readonly) NSString * _Nullable currency __attribute__((swift_name("currency")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureGiftCardInfo.Companion")))
@interface MsdkCoreThreeDSecureGiftCardInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureGiftCardInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureGiftCardInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 *
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureInfo")))
@interface MsdkCoreThreeDSecureInfo : MsdkCoreBase
- (instancetype)initWithThreeDSecureCustomerInfo:(MsdkCoreThreeDSecureCustomerInfo * _Nullable)threeDSecureCustomerInfo threeDSecurePaymentInfo:(MsdkCoreThreeDSecurePaymentInfo * _Nullable)threeDSecurePaymentInfo __attribute__((swift_name("init(threeDSecureCustomerInfo:threeDSecurePaymentInfo:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureInfoFactory *companion __attribute__((swift_name("companion")));

/**
 * object with information about the customer [ThreeDSecureCustomerInfo][com.paymentpage.msdk.core.domain.entities.init.threeDSecure.ThreeDSecureCustomerInfo]
 */
@property (readonly) MsdkCoreThreeDSecureCustomerInfo * _Nullable threeDSecureCustomerInfo __attribute__((swift_name("threeDSecureCustomerInfo")));

/**
 * information about the purchase details and indication of the preferable authentication flow [ThreeDSecurePaymentInfo][com.paymentpage.msdk.core.domain.entities.init.threeDSecure.ThreeDSecurePaymentInfo]
 */
@property (readonly) MsdkCoreThreeDSecurePaymentInfo * _Nullable threeDSecurePaymentInfo __attribute__((swift_name("threeDSecurePaymentInfo")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureInfo.Factory")))
@interface MsdkCoreThreeDSecureInfoFactory : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)factory __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureInfoFactory *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * object with information about previous customer authentication
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureMpiResultInfo")))
@interface MsdkCoreThreeDSecureMpiResultInfo : MsdkCoreBase
- (instancetype)initWithAcsOperationId:(NSString * _Nullable)acsOperationId authenticationFlow:(NSString * _Nullable)authenticationFlow authenticationTimestamp:(NSString * _Nullable)authenticationTimestamp __attribute__((swift_name("init(acsOperationId:authenticationFlow:authenticationTimestamp:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureMpiResultInfoCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable acsOperationId __attribute__((swift_name("acsOperationId")));
@property (readonly) NSString * _Nullable authenticationFlow __attribute__((swift_name("authenticationFlow")));
@property (readonly) NSString * _Nullable authenticationTimestamp __attribute__((swift_name("authenticationTimestamp")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureMpiResultInfo.Companion")))
@interface MsdkCoreThreeDSecureMpiResultInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureMpiResultInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureMpiResultInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecurePage")))
@interface MsdkCoreThreeDSecurePage : MsdkCoreBase
- (instancetype)initWithContent:(NSString * _Nullable)content loadUrl:(NSString * _Nullable)loadUrl returnUrl:(NSString * _Nullable)returnUrl type:(MsdkCoreThreeDSecurePageType *)type __attribute__((swift_name("init(content:loadUrl:returnUrl:type:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecurePageCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable content __attribute__((swift_name("content")));
@property (readonly) NSString * _Nullable loadUrl __attribute__((swift_name("loadUrl")));
@property (readonly) NSString * _Nullable returnUrl __attribute__((swift_name("returnUrl")));
@property (readonly) MsdkCoreThreeDSecurePageType *type __attribute__((swift_name("type")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecurePage.Companion")))
@interface MsdkCoreThreeDSecurePageCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecurePageCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecurePageType")))
@interface MsdkCoreThreeDSecurePageType : MsdkCoreKotlinEnum<MsdkCoreThreeDSecurePageType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecurePageTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreThreeDSecurePageType *threeDs1 __attribute__((swift_name("threeDs1")));
@property (class, readonly) MsdkCoreThreeDSecurePageType *threeDs2Frictionless __attribute__((swift_name("threeDs2Frictionless")));
@property (class, readonly) MsdkCoreThreeDSecurePageType *threeDs2Challenge __attribute__((swift_name("threeDs2Challenge")));
+ (MsdkCoreKotlinArray<MsdkCoreThreeDSecurePageType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreThreeDSecurePageType *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecurePageType.Companion")))
@interface MsdkCoreThreeDSecurePageTypeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecurePageTypeCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(MsdkCoreKotlinArray<id<MsdkCoreKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * information about the purchase details and indication of the preferable authentication flow
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecurePaymentInfo")))
@interface MsdkCoreThreeDSecurePaymentInfo : MsdkCoreBase
- (instancetype)initWithReorder:(NSString * _Nullable)reorder preorderPurchase:(NSString * _Nullable)preorderPurchase preorderDate:(NSString * _Nullable)preorderDate challengeIndicator:(NSString * _Nullable)challengeIndicator challengeWindow:(NSString * _Nullable)challengeWindow giftCard:(MsdkCoreThreeDSecureGiftCardInfo * _Nullable)giftCard __attribute__((swift_name("init(reorder:preorderPurchase:preorderDate:challengeIndicator:challengeWindow:giftCard:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecurePaymentInfoCompanion *companion __attribute__((swift_name("companion")));
- (NSArray<NSString *> *)getParamsForPaymentRiskSignature __attribute__((swift_name("getParamsForPaymentRiskSignature()")));
@property (readonly) NSString * _Nullable challengeIndicator __attribute__((swift_name("challengeIndicator")));
@property (readonly) NSString * _Nullable challengeWindow __attribute__((swift_name("challengeWindow")));

/**
 * object, which contains information about payment with prepaid card or gift card
 */
@property (readonly) MsdkCoreThreeDSecureGiftCardInfo * _Nullable giftCard __attribute__((swift_name("giftCard")));
@property (readonly) NSString * _Nullable preorderDate __attribute__((swift_name("preorderDate")));
@property (readonly) NSString * _Nullable preorderPurchase __attribute__((swift_name("preorderPurchase")));
@property (readonly) NSString * _Nullable reorder __attribute__((swift_name("reorder")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecurePaymentInfo.Companion")))
@interface MsdkCoreThreeDSecurePaymentInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecurePaymentInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecurePaymentInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * object with shipping details
 *
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("ThreeDSecureShippingInfo")))
@interface MsdkCoreThreeDSecureShippingInfo : MsdkCoreBase
- (instancetype)initWithType:(NSString * _Nullable)type deliveryTime:(NSString * _Nullable)deliveryTime deliveryEmail:(NSString * _Nullable)deliveryEmail addressUsageIndicator:(NSString * _Nullable)addressUsageIndicator addressUsage:(NSString * _Nullable)addressUsage city:(NSString * _Nullable)city country:(NSString * _Nullable)country address:(NSString * _Nullable)address postal:(NSString * _Nullable)postal regionCode:(NSString * _Nullable)regionCode nameIndicator:(NSString * _Nullable)nameIndicator __attribute__((swift_name("init(type:deliveryTime:deliveryEmail:addressUsageIndicator:addressUsage:city:country:address:postal:regionCode:nameIndicator:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeDSecureShippingInfoCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSString * _Nullable address __attribute__((swift_name("address")));
@property (readonly) NSString * _Nullable addressUsage __attribute__((swift_name("addressUsage")));
@property (readonly) NSString * _Nullable addressUsageIndicator __attribute__((swift_name("addressUsageIndicator")));
@property (readonly) NSString * _Nullable city __attribute__((swift_name("city")));
@property (readonly) NSString * _Nullable country __attribute__((swift_name("country")));
@property (readonly) NSString * _Nullable deliveryEmail __attribute__((swift_name("deliveryEmail")));
@property (readonly) NSString * _Nullable deliveryTime __attribute__((swift_name("deliveryTime")));
@property (readonly) NSString * _Nullable nameIndicator __attribute__((swift_name("nameIndicator")));
@property (readonly) NSString * _Nullable postal __attribute__((swift_name("postal")));
@property (readonly) NSString * _Nullable regionCode __attribute__((swift_name("regionCode")));
@property (readonly) NSString * _Nullable type __attribute__((swift_name("type")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThreeDSecureShippingInfo.Companion")))
@interface MsdkCoreThreeDSecureShippingInfoCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeDSecureShippingInfoCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreThreeDSecureShippingInfo *)default __attribute__((swift_name("default()")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2")))
@interface MsdkCoreThreeds2 : MsdkCoreBase
- (instancetype)initWithIframe:(MsdkCoreThreeds2Iframe * _Nullable)iframe redirect:(MsdkCoreThreeds2Redirect * _Nullable)redirect __attribute__((swift_name("init(iframe:redirect:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeds2Companion *companion __attribute__((swift_name("companion")));
@property (readonly) MsdkCoreThreeds2Iframe * _Nullable iframe __attribute__((swift_name("iframe")));
@property (readonly) MsdkCoreThreeds2Redirect * _Nullable redirect __attribute__((swift_name("redirect")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2.Companion")))
@interface MsdkCoreThreeds2Companion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeds2Companion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2Iframe")))
@interface MsdkCoreThreeds2Iframe : MsdkCoreBase
- (instancetype)initWithUrl:(NSString *)url params:(NSDictionary<NSString *, NSString *> * _Nullable)params __attribute__((swift_name("init(url:params:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeds2IframeCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSDictionary<NSString *, NSString *> * _Nullable params __attribute__((swift_name("params")));
@property (readonly) NSString *url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2Iframe.Companion")))
@interface MsdkCoreThreeds2IframeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeds2IframeCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2Redirect")))
@interface MsdkCoreThreeds2Redirect : MsdkCoreBase
- (instancetype)initWithUrl:(NSString *)url params:(NSDictionary<NSString *, NSString *> * _Nullable)params returnUrl:(NSString * _Nullable)returnUrl __attribute__((swift_name("init(url:params:returnUrl:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreThreeds2RedirectCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreThreeds2Redirect *)doCopyUrl:(NSString *)url params:(NSDictionary<NSString *, NSString *> * _Nullable)params returnUrl:(NSString * _Nullable)returnUrl __attribute__((swift_name("doCopy(url:params:returnUrl:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSDictionary<NSString *, NSString *> * _Nullable params __attribute__((swift_name("params")));
@property (readonly) NSString * _Nullable returnUrl __attribute__((swift_name("returnUrl")));
@property (readonly) NSString *url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Threeds2Redirect.Companion")))
@interface MsdkCoreThreeds2RedirectCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreThreeds2RedirectCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("ErrorEventDelegate")))
@protocol MsdkCoreErrorEventDelegate
@required
- (void)onErrorCode:(MsdkCoreErrorCode *)code message:(NSString *)message __attribute__((swift_name("onError(code:message:)")));
- (void)onSuccess __attribute__((swift_name("onSuccess()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ErrorEventInteractor")))
@interface MsdkCoreErrorEventInteractor : MsdkCoreBase

/**
 * @note annotations
 *   kotlinx.coroutines.DelicateCoroutinesApi
*/
- (void)executeRequest:(MsdkCoreErrorEventRequest *)request callback:(id<MsdkCoreErrorEventDelegate> _Nullable)callback __attribute__((swift_name("execute(request:callback:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ErrorEventRequest")))
@interface MsdkCoreErrorEventRequest : MsdkCoreRequest
- (instancetype)initWithVersion:(NSString * _Nullable)version device:(NSString * _Nullable)device model:(NSString * _Nullable)model manufacturer:(NSString * _Nullable)manufacturer versionCode:(NSString * _Nullable)versionCode exceptionName:(NSString * _Nullable)exceptionName exceptionDescription:(NSString * _Nullable)exceptionDescription projectId:(MsdkCoreLong * _Nullable)projectId paymentId:(NSString * _Nullable)paymentId customerId:(NSString * _Nullable)customerId signature:(NSString * _Nullable)signature __attribute__((swift_name("init(version:device:model:manufacturer:versionCode:exceptionName:exceptionDescription:projectId:paymentId:customerId:signature:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) NSString * _Nullable customerId __attribute__((swift_name("customerId")));
@property (readonly) NSString * _Nullable device __attribute__((swift_name("device")));
@property (readonly) NSString * _Nullable exceptionDescription __attribute__((swift_name("exceptionDescription")));
@property (readonly) NSString * _Nullable exceptionName __attribute__((swift_name("exceptionName")));
@property (readonly) NSString * _Nullable manufacturer __attribute__((swift_name("manufacturer")));
@property (readonly) NSString * _Nullable model __attribute__((swift_name("model")));
@property (readonly) NSString * _Nullable paymentId __attribute__((swift_name("paymentId")));
@property (readonly) MsdkCoreLong * _Nullable projectId __attribute__((swift_name("projectId")));
@property (readonly) NSString * _Nullable signature __attribute__((swift_name("signature")));
@property (readonly) NSString * _Nullable version __attribute__((swift_name("version")));
@property (readonly) NSString * _Nullable versionCode __attribute__((swift_name("versionCode")));
@end

__attribute__((swift_name("BaseInteractor")))
@interface MsdkCoreBaseInteractor<R, T> : MsdkCoreBase <MsdkCoreCancellable>
- (instancetype)initWithBgDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)bgDispatcher mainDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)mainDispatcher __attribute__((swift_name("init(bgDispatcher:mainDispatcher:)"))) __attribute__((objc_designated_initializer));
- (void)cancel __attribute__((swift_name("cancel()")));
- (void)clear __attribute__((swift_name("clear()")));
- (void)executeRequest:(R)request callback:(T _Nullable)callback __attribute__((swift_name("execute(request:callback:)")));
@end

__attribute__((swift_name("CardRemoveDelegate")))
@protocol MsdkCoreCardRemoveDelegate
@required
- (void)onErrorCode:(MsdkCoreErrorCode *)code message:(NSString *)message __attribute__((swift_name("onError(code:message:)")));
- (void)onStartingRemove __attribute__((swift_name("onStartingRemove()")));
- (void)onSuccessResult:(BOOL)result __attribute__((swift_name("onSuccess(result:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardRemoveInteractor")))
@interface MsdkCoreCardRemoveInteractor : MsdkCoreBaseInteractor<MsdkCoreCardRemoveRequest *, id<MsdkCoreCardRemoveDelegate>>
- (instancetype)initWithBgDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)bgDispatcher mainDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)mainDispatcher __attribute__((swift_name("init(bgDispatcher:mainDispatcher:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardRemoveRequest")))
@interface MsdkCoreCardRemoveRequest : MsdkCoreRequest
- (instancetype)initWithId:(int64_t)id __attribute__((swift_name("init(id:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) int64_t id __attribute__((swift_name("id")));
@end


/**
 * Callback for init request.
 */
__attribute__((swift_name("InitDelegate")))
@protocol MsdkCoreInitDelegate
@required

/**
 * If error occurred
 */
- (void)onErrorCode:(MsdkCoreErrorCode *)code message:(NSString *)message __attribute__((swift_name("onError(code:message:)")));

/**
 * Init response
 */
- (void)onInitReceivedPaymentMethods:(NSArray<MsdkCorePaymentMethod *> *)paymentMethods savedAccounts:(NSArray<MsdkCoreSavedAccount *> *)savedAccounts __attribute__((swift_name("onInitReceived(paymentMethods:savedAccounts:)")));

/**
 * If paymetn exist for payment id
 * @param payment exist payment object [Payment][com.paymentpage.msdk.core.domain.entities.payment.Payment]
 */
- (void)onPaymentRestoredPayment:(MsdkCorePayment *)payment __attribute__((swift_name("onPaymentRestored(payment:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InitInteractor")))
@interface MsdkCoreInitInteractor : MsdkCoreBaseInteractor<MsdkCoreInitRequest *, id<MsdkCoreInitDelegate>>
- (instancetype)initWithBgDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)bgDispatcher mainDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)mainDispatcher __attribute__((swift_name("init(bgDispatcher:mainDispatcher:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InitRequest")))
@interface MsdkCoreInitRequest : MsdkCoreRequest
- (instancetype)initWithPaymentInfo:(MsdkCorePaymentInfo *)paymentInfo recurrentInfo:(MsdkCoreRecurrentInfo * _Nullable)recurrentInfo additionalFields:(NSArray<MsdkCoreCustomerFieldValue *> *)additionalFields __attribute__((swift_name("init(paymentInfo:recurrentInfo:additionalFields:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) NSArray<MsdkCoreCustomerFieldValue *> *additionalFields __attribute__((swift_name("additionalFields")));
@property (readonly) MsdkCorePaymentInfo *paymentInfo __attribute__((swift_name("paymentInfo")));
@property (readonly) MsdkCoreRecurrentInfo * _Nullable recurrentInfo __attribute__((swift_name("recurrentInfo")));
@end

__attribute__((swift_name("PaymentStatusDelegate")))
@protocol MsdkCorePaymentStatusDelegate
@required
- (void)onClarificationFieldsClarificationFields:(NSArray<MsdkCoreClarificationField *> *)clarificationFields payment:(MsdkCorePayment *)payment __attribute__((swift_name("onClarificationFields(clarificationFields:payment:)")));
- (void)onCompleteWithDeclineIsTryAgain:(BOOL)isTryAgain paymentMessage:(NSString * _Nullable)paymentMessage payment:(MsdkCorePayment *)payment __attribute__((swift_name("onCompleteWithDecline(isTryAgain:paymentMessage:payment:)")));
- (void)onCompleteWithSuccessPayment:(MsdkCorePayment *)payment __attribute__((swift_name("onCompleteWithSuccess(payment:)")));
- (void)onErrorCode:(MsdkCoreErrorCode *)code message:(NSString *)message __attribute__((swift_name("onError(code:message:)")));
- (void)onStatusChangedStatus:(MsdkCorePaymentStatus *)status payment:(MsdkCorePayment *)payment __attribute__((swift_name("onStatusChanged(status:payment:)")));
- (void)onThreeDSecureThreeDSecurePage:(MsdkCoreThreeDSecurePage *)threeDSecurePage isCascading:(BOOL)isCascading payment:(MsdkCorePayment *)payment __attribute__((swift_name("onThreeDSecure(threeDSecurePage:isCascading:payment:)")));
- (void)onThreeDSecureRedirectComplete __attribute__((swift_name("onThreeDSecureRedirectComplete()")));
@end

__attribute__((swift_name("PayDelegate")))
@protocol MsdkCorePayDelegate <MsdkCorePaymentStatusDelegate>
@required
- (void)onCustomerFieldsCustomerFields:(NSArray<MsdkCoreCustomerField *> *)customerFields __attribute__((swift_name("onCustomerFields(customerFields:)")));
- (void)onPaymentCreated __attribute__((swift_name("onPaymentCreated()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PayInteractor")))
@interface MsdkCorePayInteractor : MsdkCoreBaseInteractor<MsdkCorePayRequest *, id<MsdkCorePayDelegate>>
- (instancetype)initWithBgDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)bgDispatcher mainDispatcher:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)mainDispatcher __attribute__((swift_name("init(bgDispatcher:mainDispatcher:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (void)cancel __attribute__((swift_name("cancel()")));
- (void)continueCheckStatus __attribute__((swift_name("continueCheckStatus()")));
- (void)sendClarificationFieldsFields:(NSArray<MsdkCoreClarificationFieldValue *> *)fields __attribute__((swift_name("sendClarificationFields(fields:)")));
- (void)sendCustomerFieldsFields:(NSArray<MsdkCoreCustomerFieldValue *> *)fields __attribute__((swift_name("sendCustomerFields(fields:)")));
- (void)threeDSecureRedirectHandleUrl:(NSString *)url __attribute__((swift_name("threeDSecureRedirectHandle(url:)")));
@end

__attribute__((swift_name("PayRequest")))
@interface MsdkCorePayRequest : MsdkCoreRequest
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@end

__attribute__((swift_name("ApplePayRequest")))
@interface MsdkCoreApplePayRequest : MsdkCorePayRequest
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApplePayAuthRequest")))
@interface MsdkCoreApplePayAuthRequest : MsdkCoreApplePayRequest
- (instancetype)initWithToken:(NSString *)token __attribute__((swift_name("init(token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApplePaySaleRequest")))
@interface MsdkCoreApplePaySaleRequest : MsdkCoreApplePayRequest
- (instancetype)initWithToken:(NSString *)token __attribute__((swift_name("init(token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApplePayVerifyRequest")))
@interface MsdkCoreApplePayVerifyRequest : MsdkCoreApplePayRequest
- (instancetype)initWithToken:(NSString *)token __attribute__((swift_name("init(token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApsSaleRequest")))
@interface MsdkCoreApsSaleRequest : MsdkCorePayRequest
- (instancetype)initWithMethodCode:(NSString *)methodCode __attribute__((swift_name("init(methodCode:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *methodCode __attribute__((swift_name("methodCode")));
@end

__attribute__((swift_name("CardPayRequest")))
@interface MsdkCoreCardPayRequest : MsdkCorePayRequest
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StoredCardType")))
@interface MsdkCoreStoredCardType : MsdkCoreKotlinEnum<MsdkCoreStoredCardType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreStoredCardTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreStoredCardType *none __attribute__((swift_name("none")));
@property (class, readonly) MsdkCoreStoredCardType *type0 __attribute__((swift_name("type0")));
@property (class, readonly) MsdkCoreStoredCardType *type1 __attribute__((swift_name("type1")));
@property (class, readonly) MsdkCoreStoredCardType *type2 __attribute__((swift_name("type2")));
@property (class, readonly) MsdkCoreStoredCardType *type3 __attribute__((swift_name("type3")));
@property (class, readonly) MsdkCoreStoredCardType *type4 __attribute__((swift_name("type4")));
@property (class, readonly) MsdkCoreStoredCardType *type5 __attribute__((swift_name("type5")));
@property (class, readonly) MsdkCoreStoredCardType *type6 __attribute__((swift_name("type6")));
+ (MsdkCoreKotlinArray<MsdkCoreStoredCardType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreStoredCardType *> *entries __attribute__((swift_name("entries")));
@property (readonly) MsdkCoreInt * _Nullable value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StoredCardType.Companion")))
@interface MsdkCoreStoredCardTypeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreStoredCardTypeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreStoredCardType *)fromValue:(MsdkCoreInt * _Nullable)value __attribute__((swift_name("from(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardAuthRequest")))
@interface MsdkCoreCardAuthRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv pan:(NSString *)pan expiryDate:(MsdkCoreCardDate *)expiryDate cardHolder:(NSString *)cardHolder saveCard:(BOOL)saveCard storedCardType:(MsdkCoreStoredCardType * _Nullable)storedCardType __attribute__((swift_name("init(cvv:pan:expiryDate:cardHolder:saveCard:storedCardType:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) NSString *cardHolder __attribute__((swift_name("cardHolder")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property (readonly) MsdkCoreCardDate *expiryDate __attribute__((swift_name("expiryDate")));
@property (readonly) NSString *pan __attribute__((swift_name("pan")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) BOOL saveCard __attribute__((swift_name("saveCard")));
@property (readonly) MsdkCoreStoredCardType * _Nullable storedCardType __attribute__((swift_name("storedCardType")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardAuthTokenizeRequest")))
@interface MsdkCoreCardAuthTokenizeRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv __attribute__((swift_name("init(cvv:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SavedCardAuthRequest")))
@interface MsdkCoreSavedCardAuthRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv accountId:(int64_t)accountId __attribute__((swift_name("init(cvv:accountId:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) int64_t accountId __attribute__((swift_name("accountId")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardSaleTokenizeRequest")))
@interface MsdkCoreCardSaleTokenizeRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv __attribute__((swift_name("init(cvv:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NewCardSaleRequest")))
@interface MsdkCoreNewCardSaleRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv pan:(NSString *)pan expiryDate:(MsdkCoreCardDate *)expiryDate cardHolder:(NSString *)cardHolder saveCard:(BOOL)saveCard storedCardType:(MsdkCoreStoredCardType * _Nullable)storedCardType recipientInfo:(MsdkCoreRecipientInfo * _Nullable)recipientInfo __attribute__((swift_name("init(cvv:pan:expiryDate:cardHolder:saveCard:storedCardType:recipientInfo:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (MsdkCoreNewCardSaleRequest *)doCopyCvv:(NSString *)cvv pan:(NSString *)pan expiryDate:(MsdkCoreCardDate *)expiryDate cardHolder:(NSString *)cardHolder saveCard:(BOOL)saveCard storedCardType:(MsdkCoreStoredCardType * _Nullable)storedCardType recipientInfo:(MsdkCoreRecipientInfo * _Nullable)recipientInfo __attribute__((swift_name("doCopy(cvv:pan:expiryDate:cardHolder:saveCard:storedCardType:recipientInfo:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *cardHolder __attribute__((swift_name("cardHolder")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property (readonly) MsdkCoreCardDate *expiryDate __attribute__((swift_name("expiryDate")));
@property (readonly) NSString *pan __attribute__((swift_name("pan")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) BOOL saveCard __attribute__((swift_name("saveCard")));
@property (readonly) MsdkCoreStoredCardType * _Nullable storedCardType __attribute__((swift_name("storedCardType")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SavedCardSaleRequest")))
@interface MsdkCoreSavedCardSaleRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv accountId:(int64_t)accountId __attribute__((swift_name("init(cvv:accountId:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) int64_t accountId __attribute__((swift_name("accountId")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardTokenizeRequest")))
@interface MsdkCoreCardTokenizeRequest : MsdkCoreCardPayRequest
- (instancetype)initWithPan:(NSString *)pan expiryDate:(MsdkCoreCardDate *)expiryDate cardHolder:(NSString *)cardHolder __attribute__((swift_name("init(pan:expiryDate:cardHolder:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) NSString *cardHolder __attribute__((swift_name("cardHolder")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) MsdkCoreCardDate *expiryDate __attribute__((swift_name("expiryDate")));
@property (readonly) NSString *pan __attribute__((swift_name("pan")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardVerifyRequest")))
@interface MsdkCoreCardVerifyRequest : MsdkCoreCardPayRequest
- (instancetype)initWithCvv:(NSString *)cvv pan:(NSString *)pan expiryDate:(MsdkCoreCardDate *)expiryDate cardHolder:(NSString *)cardHolder storedCardType:(MsdkCoreStoredCardType * _Nullable)storedCardType __attribute__((swift_name("init(cvv:pan:expiryDate:cardHolder:storedCardType:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property (readonly) NSString *cardHolder __attribute__((swift_name("cardHolder")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) NSString *cvv __attribute__((swift_name("cvv")));
@property (readonly) MsdkCoreCardDate *expiryDate __attribute__((swift_name("expiryDate")));
@property (readonly) NSString *pan __attribute__((swift_name("pan")));
@property (readonly) MsdkCoreStoredCardType * _Nullable storedCardType __attribute__((swift_name("storedCardType")));
@end

__attribute__((swift_name("GooglePayRequest")))
@interface MsdkCoreGooglePayRequest : MsdkCorePayRequest
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (readonly) MsdkCoreGooglePayEnvironment *environment __attribute__((swift_name("environment")));
@property (readonly) NSString *merchantId __attribute__((swift_name("merchantId")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GooglePayAuthRequest")))
@interface MsdkCoreGooglePayAuthRequest : MsdkCoreGooglePayRequest
- (instancetype)initWithMerchantId:(NSString *)merchantId token:(NSString *)token environment:(MsdkCoreGooglePayEnvironment *)environment __attribute__((swift_name("init(merchantId:token:environment:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) MsdkCoreGooglePayEnvironment *environment __attribute__((swift_name("environment")));
@property (readonly) NSString *merchantId __attribute__((swift_name("merchantId")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GooglePayEnvironment")))
@interface MsdkCoreGooglePayEnvironment : MsdkCoreKotlinEnum<MsdkCoreGooglePayEnvironment *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) MsdkCoreGooglePayEnvironment *test __attribute__((swift_name("test")));
@property (class, readonly) MsdkCoreGooglePayEnvironment *prod __attribute__((swift_name("prod")));
+ (MsdkCoreKotlinArray<MsdkCoreGooglePayEnvironment *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreGooglePayEnvironment *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GooglePaySaleRequest")))
@interface MsdkCoreGooglePaySaleRequest : MsdkCoreGooglePayRequest
- (instancetype)initWithMerchantId:(NSString *)merchantId token:(NSString *)token environment:(MsdkCoreGooglePayEnvironment *)environment __attribute__((swift_name("init(merchantId:token:environment:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) MsdkCoreGooglePayEnvironment *environment __attribute__((swift_name("environment")));
@property (readonly) NSString *merchantId __attribute__((swift_name("merchantId")));
@property MsdkCoreRecipientInfo * _Nullable recipientInfo __attribute__((swift_name("recipientInfo")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GooglePayVerifyRequest")))
@interface MsdkCoreGooglePayVerifyRequest : MsdkCoreGooglePayRequest
- (instancetype)initWithMerchantId:(NSString *)merchantId token:(NSString *)token environment:(MsdkCoreGooglePayEnvironment *)environment __attribute__((swift_name("init(merchantId:token:environment:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@property (readonly) MsdkCoreGooglePayEnvironment *environment __attribute__((swift_name("environment")));
@property (readonly) NSString *merchantId __attribute__((swift_name("merchantId")));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentRestoreRequest")))
@interface MsdkCorePaymentRestoreRequest : MsdkCorePayRequest
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property NSArray<MsdkCoreCustomerFieldValue *> * _Nullable customerFields __attribute__((swift_name("customerFields")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardTypesManager")))
@interface MsdkCoreCardTypesManager : MsdkCoreBase
@property (class, readonly, getter=companion) MsdkCoreCardTypesManagerCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCorePaymentMethodCard * _Nullable)searchPan:(NSString *)pan __attribute__((swift_name("search(pan:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardTypesManager.Companion")))
@interface MsdkCoreCardTypesManagerCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreCardTypesManagerCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreCardTypesManager *)default __attribute__((swift_name("default()")));
@end

__attribute__((swift_name("SecureLogoResourceManager")))
@protocol MsdkCoreSecureLogoResourceManager
@required
- (NSString * _Nullable)getLogoUrlKey:(NSString *)key __attribute__((swift_name("getLogoUrl(key:)")));
@property (readonly) NSArray<NSString *> *allKeys __attribute__((swift_name("allKeys")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SecureLogoResourceManagerImpl")))
@interface MsdkCoreSecureLogoResourceManagerImpl : MsdkCoreBase <MsdkCoreSecureLogoResourceManager>
- (NSString * _Nullable)getLogoUrlKey:(NSString *)key __attribute__((swift_name("getLogoUrl(key:)")));
@property (readonly) NSArray<NSString *> *allKeys __attribute__((swift_name("allKeys")));
@end

__attribute__((swift_name("StringResourceManager")))
@protocol MsdkCoreStringResourceManager
@required
- (MsdkCoreLinkMessage * _Nullable)getLinkMessageByKeyKey:(NSString *)key __attribute__((swift_name("getLinkMessageByKey(key:)")));
- (NSString * _Nullable)getStringByKeyKey:(NSString *)key __attribute__((swift_name("getStringByKey(key:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StringResourceManagerImpl")))
@interface MsdkCoreStringResourceManagerImpl : MsdkCoreBase <MsdkCoreStringResourceManager>
- (MsdkCoreLinkMessage * _Nullable)getLinkMessageByKeyKey:(NSString *)key __attribute__((swift_name("getLinkMessageByKey(key:)")));
- (NSString * _Nullable)getStringByKeyKey:(NSString *)key __attribute__((swift_name("getStringByKey(key:)")));
@end


/**
 * Configuration of mock mode
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreMockConfig")))
@interface MsdkCoreMSDKCoreMockConfig : MsdkCoreBase
- (instancetype)initWithInitConfig:(MsdkCoreMockInitConfig * _Nullable)initConfig paymentStatusesConfig:(MsdkCoreMockPaymentStatusesConfig * _Nullable)paymentStatusesConfig __attribute__((swift_name("init(initConfig:paymentStatusesConfig:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreMSDKCoreMockConfigCompanion *companion __attribute__((swift_name("companion")));
@property (readonly, getter=doInitConfig) MsdkCoreMockInitConfig * _Nullable initConfig __attribute__((swift_name("initConfig")));
@property (readonly) MsdkCoreMockPaymentStatusesConfig * _Nullable paymentStatusesConfig __attribute__((swift_name("paymentStatusesConfig")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MSDKCoreMockConfig.Companion")))
@interface MsdkCoreMSDKCoreMockConfigCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreMSDKCoreMockConfigCompanion *shared __attribute__((swift_name("shared")));

/**
 * Full payment flow with decline result
 */
- (MsdkCoreMSDKCoreMockConfig *)fullDeclineFlowDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("fullDeclineFlow(duration:)")));

/**
 * Full payment flow with success result
 */
- (MsdkCoreMSDKCoreMockConfig *)fullSuccessFlowDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("fullSuccessFlow(duration:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockInitConfig")))
@interface MsdkCoreMockInitConfig : MsdkCoreBase
- (instancetype)initWithTimeout:(MsdkCoreDuration *)timeout returnPayment:(BOOL)returnPayment customerFieldsConfig:(MsdkCoreMockInitCustomerFieldsConfig *)customerFieldsConfig __attribute__((swift_name("init(timeout:returnPayment:customerFieldsConfig:)"))) __attribute__((objc_designated_initializer));
@property (readonly) MsdkCoreMockInitCustomerFieldsConfig *customerFieldsConfig __attribute__((swift_name("customerFieldsConfig")));
@property (readonly) BOOL returnPayment __attribute__((swift_name("returnPayment")));
@property (readonly) MsdkCoreDuration *timeout __attribute__((swift_name("timeout")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockInitCustomerFieldsConfig")))
@interface MsdkCoreMockInitCustomerFieldsConfig : MsdkCoreKotlinEnum<MsdkCoreMockInitCustomerFieldsConfig *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) MsdkCoreMockInitCustomerFieldsConfig *none __attribute__((swift_name("none")));
@property (class, readonly) MsdkCoreMockInitCustomerFieldsConfig *all __attribute__((swift_name("all")));
+ (MsdkCoreKotlinArray<MsdkCoreMockInitCustomerFieldsConfig *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreMockInitCustomerFieldsConfig *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockPaymentStatusesConfig")))
@interface MsdkCoreMockPaymentStatusesConfig : MsdkCoreBase
- (instancetype)initWithStatuses:(NSArray<MsdkCoreMockBaseStatus *> *)statuses __attribute__((swift_name("init(statuses:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreMockPaymentStatusesConfigCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) NSArray<MsdkCoreMockBaseStatus *> *statuses __attribute__((swift_name("statuses")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockPaymentStatusesConfig.Companion")))
@interface MsdkCoreMockPaymentStatusesConfigCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreMockPaymentStatusesConfigCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreMockPaymentStatusesConfig *)declineWithClarificationAndThreeDSecureDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("declineWithClarificationAndThreeDSecure(duration:)")));
- (MsdkCoreMockPaymentStatusesConfig *)successWithClarificationAndThreeDSecureDuration:(MsdkCoreDuration *)duration __attribute__((swift_name("successWithClarificationAndThreeDSecure(duration:)")));
@end

__attribute__((swift_name("MockBaseStatus")))
@interface MsdkCoreMockBaseStatus : MsdkCoreBase
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@property (readonly) MsdkCoreDuration * _Nullable duration __attribute__((swift_name("duration")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaiting3dsResultStatus")))
@interface MsdkCoreMockAwaiting3dsResultStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithCascading:(BOOL)cascading __attribute__((swift_name("init(cascading:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) BOOL cascading __attribute__((swift_name("cascading")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaitingCaptureStatus")))
@interface MsdkCoreMockAwaitingCaptureStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaitingClarificationStatus")))
@interface MsdkCoreMockAwaitingClarificationStatus : MsdkCoreMockBaseStatus
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaitingConfirmationStatus")))
@interface MsdkCoreMockAwaitingConfirmationStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaitingCustomerStatus")))
@interface MsdkCoreMockAwaitingCustomerStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockAwaitingRedirectResultStatus")))
@interface MsdkCoreMockAwaitingRedirectResultStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockCanceledStatus")))
@interface MsdkCoreMockCanceledStatus : MsdkCoreMockBaseStatus
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockDeclineStatus")))
@interface MsdkCoreMockDeclineStatus : MsdkCoreMockBaseStatus
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((swift_name("MockErrorStatus")))
@interface MsdkCoreMockErrorStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration exception:(MsdkCoreKotlinException *)exception __attribute__((swift_name("init(duration:exception:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) MsdkCoreKotlinException *exception __attribute__((swift_name("exception")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockNetworkIsNotAvailableStatus")))
@interface MsdkCoreMockNetworkIsNotAvailableStatus : MsdkCoreMockErrorStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration exception:(MsdkCoreKotlinException *)exception __attribute__((swift_name("init(duration:exception:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockPartiallyRefundedStatus")))
@interface MsdkCoreMockPartiallyRefundedStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockProcessingStatus")))
@interface MsdkCoreMockProcessingStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockRefundProcessingStatus")))
@interface MsdkCoreMockRefundProcessingStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockRefundedStatus")))
@interface MsdkCoreMockRefundedStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockReversalProcessingStatus")))
@interface MsdkCoreMockReversalProcessingStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockReversedStatus")))
@interface MsdkCoreMockReversedStatus : MsdkCoreMockBaseStatus
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MockSuccessStatus")))
@interface MsdkCoreMockSuccessStatus : MsdkCoreMockBaseStatus
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithDuration:(MsdkCoreDuration * _Nullable)duration __attribute__((swift_name("init(duration:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomHeadersPlugin")))
@interface MsdkCoreCustomHeadersPlugin : MsdkCoreBase
- (instancetype)initWithHeaders:(NSDictionary<NSString *, NSString *> *)headers __attribute__((swift_name("init(headers:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreCustomHeadersPluginPlugin *companion __attribute__((swift_name("companion")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomHeadersPlugin.Config")))
@interface MsdkCoreCustomHeadersPluginConfig : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (MsdkCoreCustomHeadersPlugin *)build __attribute__((swift_name("build()")));
@property NSDictionary<NSString *, NSString *> *headers __attribute__((swift_name("headers")));
@end

__attribute__((swift_name("Ktor_client_coreHttpClientPlugin")))
@protocol MsdkCoreKtor_client_coreHttpClientPlugin
@required
- (void)installPlugin:(id)plugin scope:(MsdkCoreKtor_client_coreHttpClient *)scope __attribute__((swift_name("install(plugin:scope:)")));
- (id)prepareBlock:(void (^)(id))block __attribute__((swift_name("prepare(block:)")));
@property (readonly) MsdkCoreKtor_utilsAttributeKey<id> *key __attribute__((swift_name("key")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CustomHeadersPlugin.Plugin")))
@interface MsdkCoreCustomHeadersPluginPlugin : MsdkCoreBase <MsdkCoreKtor_client_coreHttpClientPlugin>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)plugin __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreCustomHeadersPluginPlugin *shared __attribute__((swift_name("shared")));
- (void)installPlugin:(MsdkCoreCustomHeadersPlugin *)plugin scope:(MsdkCoreKtor_client_coreHttpClient *)scope __attribute__((swift_name("install(plugin:scope:)")));
- (MsdkCoreCustomHeadersPlugin *)prepareBlock:(void (^)(MsdkCoreCustomHeadersPluginConfig *))block __attribute__((swift_name("prepare(block:)")));
@property (readonly) MsdkCoreKtor_utilsAttributeKey<MsdkCoreCustomHeadersPlugin *> *key __attribute__((swift_name("key")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonFixTranslationsAsMapPlugin")))
@interface MsdkCoreJsonFixTranslationsAsMapPlugin : MsdkCoreBase
- (instancetype)initWithUrls:(NSArray<NSString *> *)urls __attribute__((swift_name("init(urls:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreJsonFixTranslationsAsMapPluginPlugin *companion __attribute__((swift_name("companion")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonFixTranslationsAsMapPlugin.Config")))
@interface MsdkCoreJsonFixTranslationsAsMapPluginConfig : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (MsdkCoreJsonFixTranslationsAsMapPlugin *)build __attribute__((swift_name("build()")));
@property NSArray<NSString *> * _Nullable urls __attribute__((swift_name("urls")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonFixTranslationsAsMapPlugin.Plugin")))
@interface MsdkCoreJsonFixTranslationsAsMapPluginPlugin : MsdkCoreBase <MsdkCoreKtor_client_coreHttpClientPlugin>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)plugin __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreJsonFixTranslationsAsMapPluginPlugin *shared __attribute__((swift_name("shared")));
- (void)installPlugin:(MsdkCoreJsonFixTranslationsAsMapPlugin *)plugin scope:(MsdkCoreKtor_client_coreHttpClient *)scope __attribute__((swift_name("install(plugin:scope:)")));
- (MsdkCoreJsonFixTranslationsAsMapPlugin *)prepareBlock:(void (^)(MsdkCoreJsonFixTranslationsAsMapPluginConfig *))block __attribute__((swift_name("prepare(block:)")));
@property (readonly) MsdkCoreKtor_utilsAttributeKey<MsdkCoreJsonFixTranslationsAsMapPlugin *> *key __attribute__((swift_name("key")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonPlugin")))
@interface MsdkCoreJsonPlugin : MsdkCoreBase
@property (class, readonly, getter=companion) MsdkCoreJsonPluginPlugin *companion __attribute__((swift_name("companion")));
@property (readonly) id<MsdkCoreKtor_client_jsonJsonSerializer> serializer __attribute__((swift_name("serializer")));
@end


/**
 * [JsonPlugin] configuration that is used during installation
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonPlugin.Config")))
@interface MsdkCoreJsonPluginConfig : MsdkCoreBase

/**
 * [JsonPlugin] configuration that is used during installation
 */
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));

/**
 * [JsonPlugin] configuration that is used during installation
 */
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));

/**
 * Adds accepted content types. Be aware that [ContentType.Application.Json] accepted by default is removed from
 * the list if you use this function to provide accepted content types.
 * It also affects `Accept` request header value.
 */
- (void)acceptContentTypes:(MsdkCoreKotlinArray<MsdkCoreKtor_httpContentType *> *)contentTypes __attribute__((swift_name("accept(contentTypes:)")));

/**
 * Adds accepted content types. Existing content types will not be removed.
 */
- (void)receiveMatcher:(id<MsdkCoreKtor_httpContentTypeMatcher>)matcher __attribute__((swift_name("receive(matcher:)")));

/**
 * List of content types that are handled by this feature.
 * It also affects `Accept` request header value.
 * Please note that wildcard content types are supported but no quality specification provided.
 */
@property NSArray<MsdkCoreKtor_httpContentType *> *acceptContentTypes __attribute__((swift_name("acceptContentTypes")));

/**
 * List of content type matchers that are handled by this feature.
 * Please note that wildcard content types are supported but no quality specification provided.
 */
@property NSArray<id<MsdkCoreKtor_httpContentTypeMatcher>> *receiveContentTypeMatchers __attribute__((swift_name("receiveContentTypeMatchers")));

/**
 * Serializer that will be used for serializing requests and deserializing response bodies.
 *
 * Default value for [serializer] is [defaultSerializer].
 */
@property id<MsdkCoreKtor_client_jsonJsonSerializer> _Nullable serializer __attribute__((swift_name("serializer")));
@end


/**
 * @ThreadLocal
companion object for feature installation
 */
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonPlugin.Plugin")))
@interface MsdkCoreJsonPluginPlugin : MsdkCoreBase <MsdkCoreKtor_client_coreHttpClientPlugin>
+ (instancetype)alloc __attribute__((unavailable));

/**
 * @ThreadLocal
companion object for feature installation
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)plugin __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreJsonPluginPlugin *shared __attribute__((swift_name("shared")));
- (void)installPlugin:(MsdkCoreJsonPlugin *)plugin scope:(MsdkCoreKtor_client_coreHttpClient *)scope __attribute__((swift_name("install(plugin:scope:)")));
- (MsdkCoreJsonPlugin *)prepareBlock:(void (^)(MsdkCoreJsonPluginConfig *))block __attribute__((swift_name("prepare(block:)")));
@property (readonly) MsdkCoreKtor_utilsAttributeKey<MsdkCoreJsonPlugin *> *key __attribute__((swift_name("key")));
@end

__attribute__((swift_name("Ktor_client_loggingLogger")))
@protocol MsdkCoreKtor_client_loggingLogger
@required
- (void)logMessage:(NSString *)message __attribute__((swift_name("log(message:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LoggerDelegate")))
@interface MsdkCoreLoggerDelegate : MsdkCoreBase <MsdkCoreKtor_client_loggingLogger>
- (instancetype)initWithDelegate:(void (^)(NSString *))delegate __attribute__((swift_name("init(delegate:)"))) __attribute__((objc_designated_initializer));
- (void)logMessage:(NSString *)message __attribute__((swift_name("log(message:)")));
@property (readonly) void (^delegate)(NSString *) __attribute__((swift_name("delegate")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Duration")))
@interface MsdkCoreDuration : MsdkCoreBase
@property (class, readonly, getter=companion) MsdkCoreDurationCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) int64_t millis __attribute__((swift_name("millis")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Duration.Companion")))
@interface MsdkCoreDurationCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreDurationCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreDuration *)millisMillis:(int64_t)millis __attribute__((swift_name("millis(millis:)")));
- (MsdkCoreDuration *)secondsSeconds:(int64_t)seconds __attribute__((swift_name("seconds(seconds:)")));
@end

__attribute__((swift_name("Validator")))
@protocol MsdkCoreValidator
@required
- (BOOL)isValidValue:(NSString *)value __attribute__((swift_name("isValid(value:)")));
@end

__attribute__((swift_name("BaseValidator")))
@interface MsdkCoreBaseValidator : MsdkCoreBase <MsdkCoreValidator>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)isValidValue:(NSString *)value __attribute__((swift_name("isValid(value:)")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((swift_name("LengthValidator")))
@interface MsdkCoreLengthValidator : MsdkCoreBaseValidator
- (instancetype)initWithLength:(int32_t)length __attribute__((swift_name("init(length:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((swift_name("RegexValidator")))
@interface MsdkCoreRegexValidator : MsdkCoreBaseValidator
- (instancetype)initWithPattern:(NSString *)pattern __attribute__((swift_name("init(pattern:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((swift_name("RegexWithLengthValidator")))
@interface MsdkCoreRegexWithLengthValidator : MsdkCoreBaseValidator
- (instancetype)initWithPattern:(NSString *)pattern length:(int32_t)length __attribute__((swift_name("init(pattern:length:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((swift_name("RegexWithMaxMinLengthValidator")))
@interface MsdkCoreRegexWithMaxMinLengthValidator : MsdkCoreBaseValidator
- (instancetype)initWithPattern:(NSString *)pattern minLength:(int32_t)minLength maxLength:(int32_t)maxLength __attribute__((swift_name("init(pattern:minLength:maxLength:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AboveZeroValidator")))
@interface MsdkCoreAboveZeroValidator : MsdkCoreBaseValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AvsPostCodeValidator")))
@interface MsdkCoreAvsPostCodeValidator : MsdkCoreRegexWithLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern length:(int32_t)length __attribute__((swift_name("init(pattern:length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AvsStreetAddressValidator")))
@interface MsdkCoreAvsStreetAddressValidator : MsdkCoreLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithLength:(int32_t)length __attribute__((swift_name("init(length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CardHolderNameValidator")))
@interface MsdkCoreCardHolderNameValidator : MsdkCoreBaseValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DateValidator")))
@interface MsdkCoreDateValidator : MsdkCoreRegexWithLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern length:(int32_t)length __attribute__((swift_name("init(pattern:length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EmailValidator")))
@interface MsdkCoreEmailValidator : MsdkCoreRegexWithLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern length:(int32_t)length __attribute__((swift_name("init(pattern:length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ExpiryValidator")))
@interface MsdkCoreExpiryValidator : MsdkCoreRegexWithLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern length:(int32_t)length __attribute__((swift_name("init(pattern:length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FxcmAccountNumberValidator")))
@interface MsdkCoreFxcmAccountNumberValidator : MsdkCoreRegexValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern __attribute__((swift_name("init(pattern:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MinAgeValidator")))
@interface MsdkCoreMinAgeValidator : MsdkCoreRegexValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern __attribute__((swift_name("init(pattern:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MonthValidator")))
@interface MsdkCoreMonthValidator : MsdkCoreBaseValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NetellerAccountNumberValidator")))
@interface MsdkCoreNetellerAccountNumberValidator : MsdkCoreBaseValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PanValidator")))
@interface MsdkCorePanValidator : MsdkCoreBaseValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (BOOL)validateValue:(NSString *)value __attribute__((swift_name("validate(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PhoneNumberValidator")))
@interface MsdkCorePhoneNumberValidator : MsdkCoreRegexWithMaxMinLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern minLength:(int32_t)minLength maxLength:(int32_t)maxLength __attribute__((swift_name("init(pattern:minLength:maxLength:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PostalCodeValidator")))
@interface MsdkCorePostalCodeValidator : MsdkCoreLengthValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithLength:(int32_t)length __attribute__((swift_name("init(length:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("YearValidator")))
@interface MsdkCoreYearValidator : MsdkCoreRegexValidator
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPattern:(NSString *)pattern __attribute__((swift_name("init(pattern:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

@interface MsdkCoreUserAgentData (Extensions)
- (NSDictionary<NSString *, NSString *> *)getCustomHeaders __attribute__((swift_name("getCustomHeaders()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinByteArray")))
@interface MsdkCoreKotlinByteArray : MsdkCoreBase
+ (instancetype)arrayWithSize:(int32_t)size __attribute__((swift_name("init(size:)")));
+ (instancetype)arrayWithSize:(int32_t)size init:(MsdkCoreByte *(^)(MsdkCoreInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (int8_t)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (MsdkCoreKotlinByteIterator *)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(int8_t)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

@interface MsdkCoreKotlinByteArray (Extensions)
- (NSData * _Nullable)toNSData __attribute__((swift_name("toNSData()")));
@end

__attribute__((swift_name("KotlinThrowable")))
@interface MsdkCoreKotlinThrowable : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));

/**
 * @note annotations
 *   kotlin.experimental.ExperimentalNativeApi
*/
- (MsdkCoreKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) MsdkCoreKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
- (NSError *)asError __attribute__((swift_name("asError()")));
@end

@interface MsdkCoreKotlinThrowable (Extensions)
@property (readonly) BOOL isNetworkUnavailableException __attribute__((swift_name("isNetworkUnavailableException")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NsDataUtilsKt")))
@interface MsdkCoreNsDataUtilsKt : MsdkCoreBase
+ (MsdkCoreKotlinByteArray * _Nullable)toByteArray:(NSData *)receiver __attribute__((swift_name("toByteArray(_:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerialFormat")))
@protocol MsdkCoreKotlinx_serialization_coreSerialFormat
@required
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreStringFormat")))
@protocol MsdkCoreKotlinx_serialization_coreStringFormat <MsdkCoreKotlinx_serialization_coreSerialFormat>
@required
- (id _Nullable)decodeFromStringDeserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer string:(NSString *)string __attribute__((swift_name("decodeFromString(deserializer:string:)")));
- (NSString *)encodeToStringSerializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeToString(serializer:value:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_jsonJson")))
@interface MsdkCoreKotlinx_serialization_jsonJson : MsdkCoreBase <MsdkCoreKotlinx_serialization_coreStringFormat>
@property (class, readonly, getter=companion) MsdkCoreKotlinx_serialization_jsonJsonDefault *companion __attribute__((swift_name("companion")));
- (id _Nullable)decodeFromJsonElementDeserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer element:(MsdkCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("decodeFromJsonElement(deserializer:element:)")));
- (id _Nullable)decodeFromStringString:(NSString *)string __attribute__((swift_name("decodeFromString(string:)")));
- (id _Nullable)decodeFromStringDeserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer string:(NSString *)string __attribute__((swift_name("decodeFromString(deserializer:string:)")));
- (MsdkCoreKotlinx_serialization_jsonJsonElement *)encodeToJsonElementSerializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeToJsonElement(serializer:value:)")));
- (NSString *)encodeToStringSerializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeToString(serializer:value:)")));
- (MsdkCoreKotlinx_serialization_jsonJsonElement *)parseToJsonElementString:(NSString *)string __attribute__((swift_name("parseToJsonElement(string:)")));
@property (readonly) MsdkCoreKotlinx_serialization_jsonJsonConfiguration *configuration __attribute__((swift_name("configuration")));
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinEnumCompanion")))
@interface MsdkCoreKotlinEnumCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinEnumCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface MsdkCoreKotlinArray<T> : MsdkCoreBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(MsdkCoreInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<MsdkCoreKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializationStrategy")))
@protocol MsdkCoreKotlinx_serialization_coreSerializationStrategy
@required
- (void)serializeEncoder:(id<MsdkCoreKotlinx_serialization_coreEncoder>)encoder value:(id _Nullable)value __attribute__((swift_name("serialize(encoder:value:)")));
@property (readonly) id<MsdkCoreKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDeserializationStrategy")))
@protocol MsdkCoreKotlinx_serialization_coreDeserializationStrategy
@required
- (id _Nullable)deserializeDecoder:(id<MsdkCoreKotlinx_serialization_coreDecoder>)decoder __attribute__((swift_name("deserialize(decoder:)")));
@property (readonly) id<MsdkCoreKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreKSerializer")))
@protocol MsdkCoreKotlinx_serialization_coreKSerializer <MsdkCoreKotlinx_serialization_coreSerializationStrategy, MsdkCoreKotlinx_serialization_coreDeserializationStrategy>
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
*/
__attribute__((swift_name("KotlinCoroutineContext")))
@protocol MsdkCoreKotlinCoroutineContext
@required
- (id _Nullable)foldInitial:(id _Nullable)initial operation:(id _Nullable (^)(id _Nullable, id<MsdkCoreKotlinCoroutineContextElement>))operation __attribute__((swift_name("fold(initial:operation:)")));
- (id<MsdkCoreKotlinCoroutineContextElement> _Nullable)getKey:(id<MsdkCoreKotlinCoroutineContextKey>)key __attribute__((swift_name("get(key:)")));
- (id<MsdkCoreKotlinCoroutineContext>)minusKeyKey:(id<MsdkCoreKotlinCoroutineContextKey>)key __attribute__((swift_name("minusKey(key:)")));
- (id<MsdkCoreKotlinCoroutineContext>)plusContext:(id<MsdkCoreKotlinCoroutineContext>)context __attribute__((swift_name("plus(context:)")));
@end

__attribute__((swift_name("KotlinCoroutineContextElement")))
@protocol MsdkCoreKotlinCoroutineContextElement <MsdkCoreKotlinCoroutineContext>
@required
@property (readonly) id<MsdkCoreKotlinCoroutineContextKey> key __attribute__((swift_name("key")));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
*/
__attribute__((swift_name("KotlinAbstractCoroutineContextElement")))
@interface MsdkCoreKotlinAbstractCoroutineContextElement : MsdkCoreBase <MsdkCoreKotlinCoroutineContextElement>
- (instancetype)initWithKey:(id<MsdkCoreKotlinCoroutineContextKey>)key __attribute__((swift_name("init(key:)"))) __attribute__((objc_designated_initializer));
@property (readonly) id<MsdkCoreKotlinCoroutineContextKey> key __attribute__((swift_name("key")));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
*/
__attribute__((swift_name("KotlinContinuationInterceptor")))
@protocol MsdkCoreKotlinContinuationInterceptor <MsdkCoreKotlinCoroutineContextElement>
@required
- (id<MsdkCoreKotlinContinuation>)interceptContinuationContinuation:(id<MsdkCoreKotlinContinuation>)continuation __attribute__((swift_name("interceptContinuation(continuation:)")));
- (void)releaseInterceptedContinuationContinuation:(id<MsdkCoreKotlinContinuation>)continuation __attribute__((swift_name("releaseInterceptedContinuation(continuation:)")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreCoroutineDispatcher")))
@interface MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher : MsdkCoreKotlinAbstractCoroutineContextElement <MsdkCoreKotlinContinuationInterceptor>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithKey:(id<MsdkCoreKotlinCoroutineContextKey>)key __attribute__((swift_name("init(key:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKotlinx_coroutines_coreCoroutineDispatcherKey *companion __attribute__((swift_name("companion")));
- (void)dispatchContext:(id<MsdkCoreKotlinCoroutineContext>)context block:(id<MsdkCoreKotlinx_coroutines_coreRunnable>)block __attribute__((swift_name("dispatch(context:block:)")));
- (void)dispatchYieldContext:(id<MsdkCoreKotlinCoroutineContext>)context block:(id<MsdkCoreKotlinx_coroutines_coreRunnable>)block __attribute__((swift_name("dispatchYield(context:block:)")));
- (id<MsdkCoreKotlinContinuation>)interceptContinuationContinuation:(id<MsdkCoreKotlinContinuation>)continuation __attribute__((swift_name("interceptContinuation(continuation:)")));
- (BOOL)isDispatchNeededContext:(id<MsdkCoreKotlinCoroutineContext>)context __attribute__((swift_name("isDispatchNeeded(context:)")));

/**
 * @note annotations
 *   kotlinx.coroutines.ExperimentalCoroutinesApi
*/
- (MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)limitedParallelismParallelism:(int32_t)parallelism __attribute__((swift_name("limitedParallelism(parallelism:)")));
- (MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)plusOther:(MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *)other __attribute__((swift_name("plus(other:)"))) __attribute__((unavailable("Operator '+' on two CoroutineDispatcher objects is meaningless. CoroutineDispatcher is a coroutine context element and `+` is a set-sum operator for coroutine contexts. The dispatcher to the right of `+` just replaces the dispatcher to the left.")));
- (void)releaseInterceptedContinuationContinuation:(id<MsdkCoreKotlinContinuation>)continuation __attribute__((swift_name("releaseInterceptedContinuation(continuation:)")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("KotlinException")))
@interface MsdkCoreKotlinException : MsdkCoreKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreCoroutineScope")))
@protocol MsdkCoreKotlinx_coroutines_coreCoroutineScope
@required
@property (readonly) id<MsdkCoreKotlinCoroutineContext> coroutineContext __attribute__((swift_name("coroutineContext")));
@end

__attribute__((swift_name("Ktor_ioCloseable")))
@protocol MsdkCoreKtor_ioCloseable
@required
- (void)close __attribute__((swift_name("close()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpClient")))
@interface MsdkCoreKtor_client_coreHttpClient : MsdkCoreBase <MsdkCoreKotlinx_coroutines_coreCoroutineScope, MsdkCoreKtor_ioCloseable>
- (instancetype)initWithEngine:(id<MsdkCoreKtor_client_coreHttpClientEngine>)engine userConfig:(MsdkCoreKtor_client_coreHttpClientConfig<MsdkCoreKtor_client_coreHttpClientEngineConfig *> *)userConfig __attribute__((swift_name("init(engine:userConfig:)"))) __attribute__((objc_designated_initializer));
- (void)close __attribute__((swift_name("close()")));
- (MsdkCoreKtor_client_coreHttpClient *)configBlock:(void (^)(MsdkCoreKtor_client_coreHttpClientConfig<id> *))block __attribute__((swift_name("config(block:)")));
- (BOOL)isSupportedCapability:(id<MsdkCoreKtor_client_coreHttpClientEngineCapability>)capability __attribute__((swift_name("isSupported(capability:)")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property (readonly) id<MsdkCoreKotlinCoroutineContext> coroutineContext __attribute__((swift_name("coroutineContext")));
@property (readonly) id<MsdkCoreKtor_client_coreHttpClientEngine> engine __attribute__((swift_name("engine")));
@property (readonly) MsdkCoreKtor_client_coreHttpClientEngineConfig *engineConfig __attribute__((swift_name("engineConfig")));
@property (readonly) MsdkCoreKtor_eventsEvents *monitor __attribute__((swift_name("monitor")));
@property (readonly) MsdkCoreKtor_client_coreHttpReceivePipeline *receivePipeline __attribute__((swift_name("receivePipeline")));
@property (readonly) MsdkCoreKtor_client_coreHttpRequestPipeline *requestPipeline __attribute__((swift_name("requestPipeline")));
@property (readonly) MsdkCoreKtor_client_coreHttpResponsePipeline *responsePipeline __attribute__((swift_name("responsePipeline")));
@property (readonly) MsdkCoreKtor_client_coreHttpSendPipeline *sendPipeline __attribute__((swift_name("sendPipeline")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsAttributeKey")))
@interface MsdkCoreKtor_utilsAttributeKey<T> : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((swift_name("Ktor_client_jsonJsonSerializer")))
@protocol MsdkCoreKtor_client_jsonJsonSerializer
@required
- (id)readType:(MsdkCoreKtor_utilsTypeInfo *)type body:(MsdkCoreKtor_ioInput *)body __attribute__((swift_name("read(type:body:)")));
- (MsdkCoreKtor_httpOutgoingContent *)writeData:(id)data __attribute__((swift_name("write(data:)")));
- (MsdkCoreKtor_httpOutgoingContent *)writeData:(id)data contentType:(MsdkCoreKtor_httpContentType *)contentType __attribute__((swift_name("write(data:contentType:)")));
@end

__attribute__((swift_name("Ktor_httpHeaderValueWithParameters")))
@interface MsdkCoreKtor_httpHeaderValueWithParameters : MsdkCoreBase
- (instancetype)initWithContent:(NSString *)content parameters:(NSArray<MsdkCoreKtor_httpHeaderValueParam *> *)parameters __attribute__((swift_name("init(content:parameters:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpHeaderValueWithParametersCompanion *companion __attribute__((swift_name("companion")));
- (NSString * _Nullable)parameterName:(NSString *)name __attribute__((swift_name("parameter(name:)")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note This property has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
@property (readonly) NSString *content __attribute__((swift_name("content")));
@property (readonly) NSArray<MsdkCoreKtor_httpHeaderValueParam *> *parameters __attribute__((swift_name("parameters")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpContentType")))
@interface MsdkCoreKtor_httpContentType : MsdkCoreKtor_httpHeaderValueWithParameters
- (instancetype)initWithContentType:(NSString *)contentType contentSubtype:(NSString *)contentSubtype parameters:(NSArray<MsdkCoreKtor_httpHeaderValueParam *> *)parameters __attribute__((swift_name("init(contentType:contentSubtype:parameters:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithContent:(NSString *)content parameters:(NSArray<MsdkCoreKtor_httpHeaderValueParam *> *)parameters __attribute__((swift_name("init(content:parameters:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpContentTypeCompanion *companion __attribute__((swift_name("companion")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (BOOL)matchPattern:(MsdkCoreKtor_httpContentType *)pattern __attribute__((swift_name("match(pattern:)")));
- (BOOL)matchPattern_:(NSString *)pattern __attribute__((swift_name("match(pattern_:)")));
- (MsdkCoreKtor_httpContentType *)withParameterName:(NSString *)name value:(NSString *)value __attribute__((swift_name("withParameter(name:value:)")));
- (MsdkCoreKtor_httpContentType *)withoutParameters __attribute__((swift_name("withoutParameters()")));
@property (readonly) NSString *contentSubtype __attribute__((swift_name("contentSubtype")));
@property (readonly) NSString *contentType __attribute__((swift_name("contentType")));
@end

__attribute__((swift_name("Ktor_httpContentTypeMatcher")))
@protocol MsdkCoreKtor_httpContentTypeMatcher
@required
- (BOOL)containsContentType:(MsdkCoreKtor_httpContentType *)contentType __attribute__((swift_name("contains(contentType:)")));
@end

__attribute__((swift_name("KotlinIterator")))
@protocol MsdkCoreKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end

__attribute__((swift_name("KotlinByteIterator")))
@interface MsdkCoreKotlinByteIterator : MsdkCoreBase <MsdkCoreKotlinIterator>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (MsdkCoreByte *)next __attribute__((swift_name("next()")));
- (int8_t)nextByte __attribute__((swift_name("nextByte()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializersModule")))
@interface MsdkCoreKotlinx_serialization_coreSerializersModule : MsdkCoreBase

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)dumpToCollector:(id<MsdkCoreKotlinx_serialization_coreSerializersModuleCollector>)collector __attribute__((swift_name("dumpTo(collector:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<MsdkCoreKotlinx_serialization_coreKSerializer> _Nullable)getContextualKClass:(id<MsdkCoreKotlinKClass>)kClass typeArgumentsSerializers:(NSArray<id<MsdkCoreKotlinx_serialization_coreKSerializer>> *)typeArgumentsSerializers __attribute__((swift_name("getContextual(kClass:typeArgumentsSerializers:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<MsdkCoreKotlinx_serialization_coreSerializationStrategy> _Nullable)getPolymorphicBaseClass:(id<MsdkCoreKotlinKClass>)baseClass value:(id)value __attribute__((swift_name("getPolymorphic(baseClass:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable)getPolymorphicBaseClass:(id<MsdkCoreKotlinKClass>)baseClass serializedClassName:(NSString * _Nullable)serializedClassName __attribute__((swift_name("getPolymorphic(baseClass:serializedClassName:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Kotlinx_serialization_jsonJson.Default")))
@interface MsdkCoreKotlinx_serialization_jsonJsonDefault : MsdkCoreKotlinx_serialization_jsonJson
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)default_ __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinx_serialization_jsonJsonDefault *shared __attribute__((swift_name("shared")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable(with=NormalClass(value=kotlinx/serialization/json/JsonElementSerializer))
*/
__attribute__((swift_name("Kotlinx_serialization_jsonJsonElement")))
@interface MsdkCoreKotlinx_serialization_jsonJsonElement : MsdkCoreBase
@property (class, readonly, getter=companion) MsdkCoreKotlinx_serialization_jsonJsonElementCompanion *companion __attribute__((swift_name("companion")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Kotlinx_serialization_jsonJsonConfiguration")))
@interface MsdkCoreKotlinx_serialization_jsonJsonConfiguration : MsdkCoreBase
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL allowSpecialFloatingPointValues __attribute__((swift_name("allowSpecialFloatingPointValues")));
@property (readonly) BOOL allowStructuredMapKeys __attribute__((swift_name("allowStructuredMapKeys")));
@property (readonly) NSString *classDiscriminator __attribute__((swift_name("classDiscriminator")));
@property (readonly) BOOL coerceInputValues __attribute__((swift_name("coerceInputValues")));
@property (readonly) BOOL encodeDefaults __attribute__((swift_name("encodeDefaults")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) BOOL explicitNulls __attribute__((swift_name("explicitNulls")));
@property (readonly) BOOL ignoreUnknownKeys __attribute__((swift_name("ignoreUnknownKeys")));
@property (readonly) BOOL isLenient __attribute__((swift_name("isLenient")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) id<MsdkCoreKotlinx_serialization_jsonJsonNamingStrategy> _Nullable namingStrategy __attribute__((swift_name("namingStrategy")));
@property (readonly) BOOL prettyPrint __attribute__((swift_name("prettyPrint")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSString *prettyPrintIndent __attribute__((swift_name("prettyPrintIndent")));
@property (readonly) BOOL useAlternativeNames __attribute__((swift_name("useAlternativeNames")));
@property (readonly) BOOL useArrayPolymorphism __attribute__((swift_name("useArrayPolymorphism")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreEncoder")))
@protocol MsdkCoreKotlinx_serialization_coreEncoder
@required
- (id<MsdkCoreKotlinx_serialization_coreCompositeEncoder>)beginCollectionDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor collectionSize:(int32_t)collectionSize __attribute__((swift_name("beginCollection(descriptor:collectionSize:)")));
- (id<MsdkCoreKotlinx_serialization_coreCompositeEncoder>)beginStructureDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (void)encodeBooleanValue:(BOOL)value __attribute__((swift_name("encodeBoolean(value:)")));
- (void)encodeByteValue:(int8_t)value __attribute__((swift_name("encodeByte(value:)")));
- (void)encodeCharValue:(unichar)value __attribute__((swift_name("encodeChar(value:)")));
- (void)encodeDoubleValue:(double)value __attribute__((swift_name("encodeDouble(value:)")));
- (void)encodeEnumEnumDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)enumDescriptor index:(int32_t)index __attribute__((swift_name("encodeEnum(enumDescriptor:index:)")));
- (void)encodeFloatValue:(float)value __attribute__((swift_name("encodeFloat(value:)")));
- (id<MsdkCoreKotlinx_serialization_coreEncoder>)encodeInlineDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("encodeInline(descriptor:)")));
- (void)encodeIntValue:(int32_t)value __attribute__((swift_name("encodeInt(value:)")));
- (void)encodeLongValue:(int64_t)value __attribute__((swift_name("encodeLong(value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNotNullMark __attribute__((swift_name("encodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNull __attribute__((swift_name("encodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableValueSerializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableValue(serializer:value:)")));
- (void)encodeSerializableValueSerializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableValue(serializer:value:)")));
- (void)encodeShortValue:(int16_t)value __attribute__((swift_name("encodeShort(value:)")));
- (void)encodeStringValue:(NSString *)value __attribute__((swift_name("encodeString(value:)")));
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerialDescriptor")))
@protocol MsdkCoreKotlinx_serialization_coreSerialDescriptor
@required

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSArray<id<MsdkCoreKotlinAnnotation>> *)getElementAnnotationsIndex:(int32_t)index __attribute__((swift_name("getElementAnnotations(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)getElementDescriptorIndex:(int32_t)index __attribute__((swift_name("getElementDescriptor(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (int32_t)getElementIndexName:(NSString *)name __attribute__((swift_name("getElementIndex(name:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSString *)getElementNameIndex:(int32_t)index __attribute__((swift_name("getElementName(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)isElementOptionalIndex:(int32_t)index __attribute__((swift_name("isElementOptional(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSArray<id<MsdkCoreKotlinAnnotation>> *annotations __attribute__((swift_name("annotations")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) int32_t elementsCount __attribute__((swift_name("elementsCount")));
@property (readonly) BOOL isInline __attribute__((swift_name("isInline")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) BOOL isNullable __attribute__((swift_name("isNullable")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) MsdkCoreKotlinx_serialization_coreSerialKind *kind __attribute__((swift_name("kind")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSString *serialName __attribute__((swift_name("serialName")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDecoder")))
@protocol MsdkCoreKotlinx_serialization_coreDecoder
@required
- (id<MsdkCoreKotlinx_serialization_coreCompositeDecoder>)beginStructureDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (BOOL)decodeBoolean __attribute__((swift_name("decodeBoolean()")));
- (int8_t)decodeByte __attribute__((swift_name("decodeByte()")));
- (unichar)decodeChar __attribute__((swift_name("decodeChar()")));
- (double)decodeDouble __attribute__((swift_name("decodeDouble()")));
- (int32_t)decodeEnumEnumDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)enumDescriptor __attribute__((swift_name("decodeEnum(enumDescriptor:)")));
- (float)decodeFloat __attribute__((swift_name("decodeFloat()")));
- (id<MsdkCoreKotlinx_serialization_coreDecoder>)decodeInlineDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeInline(descriptor:)")));
- (int32_t)decodeInt __attribute__((swift_name("decodeInt()")));
- (int64_t)decodeLong __attribute__((swift_name("decodeLong()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeNotNullMark __attribute__((swift_name("decodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (MsdkCoreKotlinNothing * _Nullable)decodeNull __attribute__((swift_name("decodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableValueDeserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeNullableSerializableValue(deserializer:)")));
- (id _Nullable)decodeSerializableValueDeserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeSerializableValue(deserializer:)")));
- (int16_t)decodeShort __attribute__((swift_name("decodeShort()")));
- (NSString *)decodeString __attribute__((swift_name("decodeString()")));
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("KotlinCoroutineContextKey")))
@protocol MsdkCoreKotlinCoroutineContextKey
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
*/
__attribute__((swift_name("KotlinContinuation")))
@protocol MsdkCoreKotlinContinuation
@required
- (void)resumeWithResult:(id _Nullable)result __attribute__((swift_name("resumeWith(result:)")));
@property (readonly) id<MsdkCoreKotlinCoroutineContext> context __attribute__((swift_name("context")));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
 *   kotlin.ExperimentalStdlibApi
*/
__attribute__((swift_name("KotlinAbstractCoroutineContextKey")))
@interface MsdkCoreKotlinAbstractCoroutineContextKey<B, E> : MsdkCoreBase <MsdkCoreKotlinCoroutineContextKey>
- (instancetype)initWithBaseKey:(id<MsdkCoreKotlinCoroutineContextKey>)baseKey safeCast:(E _Nullable (^)(id<MsdkCoreKotlinCoroutineContextElement>))safeCast __attribute__((swift_name("init(baseKey:safeCast:)"))) __attribute__((objc_designated_initializer));
@end


/**
 * @note annotations
 *   kotlin.ExperimentalStdlibApi
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Kotlinx_coroutines_coreCoroutineDispatcher.Key")))
@interface MsdkCoreKotlinx_coroutines_coreCoroutineDispatcherKey : MsdkCoreKotlinAbstractCoroutineContextKey<id<MsdkCoreKotlinContinuationInterceptor>, MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithBaseKey:(id<MsdkCoreKotlinCoroutineContextKey>)baseKey safeCast:(id<MsdkCoreKotlinCoroutineContextElement> _Nullable (^)(id<MsdkCoreKotlinCoroutineContextElement>))safeCast __attribute__((swift_name("init(baseKey:safeCast:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)key __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinx_coroutines_coreCoroutineDispatcherKey *shared __attribute__((swift_name("shared")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreRunnable")))
@protocol MsdkCoreKotlinx_coroutines_coreRunnable
@required
- (void)run __attribute__((swift_name("run()")));
@end

__attribute__((swift_name("Ktor_client_coreHttpClientEngine")))
@protocol MsdkCoreKtor_client_coreHttpClientEngine <MsdkCoreKotlinx_coroutines_coreCoroutineScope, MsdkCoreKtor_ioCloseable>
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)executeData:(MsdkCoreKtor_client_coreHttpRequestData *)data completionHandler:(void (^)(MsdkCoreKtor_client_coreHttpResponseData * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("execute(data:completionHandler:)")));
- (void)installClient:(MsdkCoreKtor_client_coreHttpClient *)client __attribute__((swift_name("install(client:)")));
@property (readonly) MsdkCoreKtor_client_coreHttpClientEngineConfig *config __attribute__((swift_name("config")));
@property (readonly) MsdkCoreKotlinx_coroutines_coreCoroutineDispatcher *dispatcher __attribute__((swift_name("dispatcher")));
@property (readonly) NSSet<id<MsdkCoreKtor_client_coreHttpClientEngineCapability>> *supportedCapabilities __attribute__((swift_name("supportedCapabilities")));
@end

__attribute__((swift_name("Ktor_client_coreHttpClientEngineConfig")))
@interface MsdkCoreKtor_client_coreHttpClientEngineConfig : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property BOOL pipelining __attribute__((swift_name("pipelining")));
@property MsdkCoreKtor_client_coreProxyConfig * _Nullable proxy __attribute__((swift_name("proxy")));
@property int32_t threadsCount __attribute__((swift_name("threadsCount")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpClientConfig")))
@interface MsdkCoreKtor_client_coreHttpClientConfig<T> : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (MsdkCoreKtor_client_coreHttpClientConfig<T> *)clone __attribute__((swift_name("clone()")));
- (void)engineBlock:(void (^)(T))block __attribute__((swift_name("engine(block:)")));
- (void)installClient:(MsdkCoreKtor_client_coreHttpClient *)client __attribute__((swift_name("install(client:)")));
- (void)installPlugin:(id<MsdkCoreKtor_client_coreHttpClientPlugin>)plugin configure:(void (^)(id))configure __attribute__((swift_name("install(plugin:configure:)")));
- (void)installKey:(NSString *)key block:(void (^)(MsdkCoreKtor_client_coreHttpClient *))block __attribute__((swift_name("install(key:block:)")));
- (void)plusAssignOther:(MsdkCoreKtor_client_coreHttpClientConfig<T> *)other __attribute__((swift_name("plusAssign(other:)")));
@property BOOL developmentMode __attribute__((swift_name("developmentMode")));
@property BOOL expectSuccess __attribute__((swift_name("expectSuccess")));
@property BOOL followRedirects __attribute__((swift_name("followRedirects")));
@property BOOL useDefaultTransformers __attribute__((swift_name("useDefaultTransformers")));
@end

__attribute__((swift_name("Ktor_client_coreHttpClientEngineCapability")))
@protocol MsdkCoreKtor_client_coreHttpClientEngineCapability
@required
@end

__attribute__((swift_name("Ktor_utilsAttributes")))
@protocol MsdkCoreKtor_utilsAttributes
@required
- (id)computeIfAbsentKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key block:(id (^)(void))block __attribute__((swift_name("computeIfAbsent(key:block:)")));
- (BOOL)containsKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("contains(key:)")));
- (id)getKey_:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("get(key_:)")));
- (id _Nullable)getOrNullKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("getOrNull(key:)")));
- (void)putKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key value:(id)value __attribute__((swift_name("put(key:value:)")));
- (void)removeKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("remove(key:)")));
- (id)takeKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("take(key:)")));
- (id _Nullable)takeOrNullKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("takeOrNull(key:)")));
@property (readonly) NSArray<MsdkCoreKtor_utilsAttributeKey<id> *> *allKeys __attribute__((swift_name("allKeys")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_eventsEvents")))
@interface MsdkCoreKtor_eventsEvents : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)raiseDefinition:(MsdkCoreKtor_eventsEventDefinition<id> *)definition value:(id _Nullable)value __attribute__((swift_name("raise(definition:value:)")));
- (id<MsdkCoreKotlinx_coroutines_coreDisposableHandle>)subscribeDefinition:(MsdkCoreKtor_eventsEventDefinition<id> *)definition handler:(void (^)(id _Nullable))handler __attribute__((swift_name("subscribe(definition:handler:)")));
- (void)unsubscribeDefinition:(MsdkCoreKtor_eventsEventDefinition<id> *)definition handler:(void (^)(id _Nullable))handler __attribute__((swift_name("unsubscribe(definition:handler:)")));
@end

__attribute__((swift_name("Ktor_utilsPipeline")))
@interface MsdkCoreKtor_utilsPipeline<TSubject, TContext> : MsdkCoreBase
- (instancetype)initWithPhases:(MsdkCoreKotlinArray<MsdkCoreKtor_utilsPipelinePhase *> *)phases __attribute__((swift_name("init(phases:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase interceptors:(NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptors __attribute__((swift_name("init(phase:interceptors:)"))) __attribute__((objc_designated_initializer));
- (void)addPhasePhase:(MsdkCoreKtor_utilsPipelinePhase *)phase __attribute__((swift_name("addPhase(phase:)")));
- (void)afterIntercepted __attribute__((swift_name("afterIntercepted()")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)executeContext:(TContext)context subject:(TSubject)subject completionHandler:(void (^)(TSubject _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("execute(context:subject:completionHandler:)")));
- (void)insertPhaseAfterReference:(MsdkCoreKtor_utilsPipelinePhase *)reference phase:(MsdkCoreKtor_utilsPipelinePhase *)phase __attribute__((swift_name("insertPhaseAfter(reference:phase:)")));
- (void)insertPhaseBeforeReference:(MsdkCoreKtor_utilsPipelinePhase *)reference phase:(MsdkCoreKtor_utilsPipelinePhase *)phase __attribute__((swift_name("insertPhaseBefore(reference:phase:)")));
- (void)interceptPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase block:(id<MsdkCoreKotlinSuspendFunction2>)block __attribute__((swift_name("intercept(phase:block:)")));
- (NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptorsForPhasePhase:(MsdkCoreKtor_utilsPipelinePhase *)phase __attribute__((swift_name("interceptorsForPhase(phase:)")));
- (void)mergeFrom:(MsdkCoreKtor_utilsPipeline<TSubject, TContext> *)from __attribute__((swift_name("merge(from:)")));
- (void)mergePhasesFrom:(MsdkCoreKtor_utilsPipeline<TSubject, TContext> *)from __attribute__((swift_name("mergePhases(from:)")));
- (void)resetFromFrom:(MsdkCoreKtor_utilsPipeline<TSubject, TContext> *)from __attribute__((swift_name("resetFrom(from:)")));
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property (readonly) BOOL developmentMode __attribute__((swift_name("developmentMode")));
@property (readonly) BOOL isEmpty __attribute__((swift_name("isEmpty")));
@property (readonly) NSArray<MsdkCoreKtor_utilsPipelinePhase *> *items __attribute__((swift_name("items")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpReceivePipeline")))
@interface MsdkCoreKtor_client_coreHttpReceivePipeline : MsdkCoreKtor_utilsPipeline<MsdkCoreKtor_client_coreHttpResponse *, MsdkCoreKotlinUnit *>
- (instancetype)initWithDevelopmentMode:(BOOL)developmentMode __attribute__((swift_name("init(developmentMode:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPhases:(MsdkCoreKotlinArray<MsdkCoreKtor_utilsPipelinePhase *> *)phases __attribute__((swift_name("init(phases:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase interceptors:(NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptors __attribute__((swift_name("init(phase:interceptors:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpReceivePipelinePhases *companion __attribute__((swift_name("companion")));
@property (readonly) BOOL developmentMode __attribute__((swift_name("developmentMode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpRequestPipeline")))
@interface MsdkCoreKtor_client_coreHttpRequestPipeline : MsdkCoreKtor_utilsPipeline<id, MsdkCoreKtor_client_coreHttpRequestBuilder *>
- (instancetype)initWithDevelopmentMode:(BOOL)developmentMode __attribute__((swift_name("init(developmentMode:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPhases:(MsdkCoreKotlinArray<MsdkCoreKtor_utilsPipelinePhase *> *)phases __attribute__((swift_name("init(phases:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase interceptors:(NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptors __attribute__((swift_name("init(phase:interceptors:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpRequestPipelinePhases *companion __attribute__((swift_name("companion")));
@property (readonly) BOOL developmentMode __attribute__((swift_name("developmentMode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpResponsePipeline")))
@interface MsdkCoreKtor_client_coreHttpResponsePipeline : MsdkCoreKtor_utilsPipeline<MsdkCoreKtor_client_coreHttpResponseContainer *, MsdkCoreKtor_client_coreHttpClientCall *>
- (instancetype)initWithDevelopmentMode:(BOOL)developmentMode __attribute__((swift_name("init(developmentMode:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPhases:(MsdkCoreKotlinArray<MsdkCoreKtor_utilsPipelinePhase *> *)phases __attribute__((swift_name("init(phases:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase interceptors:(NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptors __attribute__((swift_name("init(phase:interceptors:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpResponsePipelinePhases *companion __attribute__((swift_name("companion")));
@property (readonly) BOOL developmentMode __attribute__((swift_name("developmentMode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpSendPipeline")))
@interface MsdkCoreKtor_client_coreHttpSendPipeline : MsdkCoreKtor_utilsPipeline<id, MsdkCoreKtor_client_coreHttpRequestBuilder *>
- (instancetype)initWithDevelopmentMode:(BOOL)developmentMode __attribute__((swift_name("init(developmentMode:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPhases:(MsdkCoreKotlinArray<MsdkCoreKtor_utilsPipelinePhase *> *)phases __attribute__((swift_name("init(phases:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithPhase:(MsdkCoreKtor_utilsPipelinePhase *)phase interceptors:(NSArray<id<MsdkCoreKotlinSuspendFunction2>> *)interceptors __attribute__((swift_name("init(phase:interceptors:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpSendPipelinePhases *companion __attribute__((swift_name("companion")));
@property (readonly) BOOL developmentMode __attribute__((swift_name("developmentMode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsTypeInfo")))
@interface MsdkCoreKtor_utilsTypeInfo : MsdkCoreBase
- (instancetype)initWithType:(id<MsdkCoreKotlinKClass>)type reifiedType:(id<MsdkCoreKotlinKType>)reifiedType kotlinType:(id<MsdkCoreKotlinKType> _Nullable)kotlinType __attribute__((swift_name("init(type:reifiedType:kotlinType:)"))) __attribute__((objc_designated_initializer));
- (MsdkCoreKtor_utilsTypeInfo *)doCopyType:(id<MsdkCoreKotlinKClass>)type reifiedType:(id<MsdkCoreKotlinKType>)reifiedType kotlinType:(id<MsdkCoreKotlinKType> _Nullable)kotlinType __attribute__((swift_name("doCopy(type:reifiedType:kotlinType:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) id<MsdkCoreKotlinKType> _Nullable kotlinType __attribute__((swift_name("kotlinType")));
@property (readonly) id<MsdkCoreKotlinKType> reifiedType __attribute__((swift_name("reifiedType")));
@property (readonly) id<MsdkCoreKotlinKClass> type __attribute__((swift_name("type")));
@end

__attribute__((swift_name("Ktor_ioInput")))
@interface MsdkCoreKtor_ioInput : MsdkCoreBase <MsdkCoreKtor_ioCloseable>
- (instancetype)initWithHead:(MsdkCoreKtor_ioChunkBuffer *)head remaining:(int64_t)remaining pool:(id<MsdkCoreKtor_ioObjectPool>)pool __attribute__((swift_name("init(head:remaining:pool:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_ioInputCompanion *companion __attribute__((swift_name("companion")));
- (BOOL)canRead __attribute__((swift_name("canRead()")));
- (void)close __attribute__((swift_name("close()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)closeSource __attribute__((swift_name("closeSource()")));
- (int32_t)discardN:(int32_t)n __attribute__((swift_name("discard(n:)")));
- (int64_t)discardN_:(int64_t)n __attribute__((swift_name("discard(n_:)")));
- (void)discardExactN:(int32_t)n __attribute__((swift_name("discardExact(n:)")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (MsdkCoreKtor_ioChunkBuffer * _Nullable)fill __attribute__((swift_name("fill()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (int32_t)fillDestination:(MsdkCoreKtor_ioMemory *)destination offset:(int32_t)offset length:(int32_t)length __attribute__((swift_name("fill(destination:offset:length:)")));
- (BOOL)hasBytesN:(int32_t)n __attribute__((swift_name("hasBytes(n:)")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)markNoMoreChunksAvailable __attribute__((swift_name("markNoMoreChunksAvailable()")));
- (int32_t)peekToBuffer:(MsdkCoreKtor_ioChunkBuffer *)buffer __attribute__((swift_name("peekTo(buffer:)")));
- (int64_t)peekToDestination:(MsdkCoreKtor_ioMemory *)destination destinationOffset:(int64_t)destinationOffset offset:(int64_t)offset min:(int64_t)min max:(int64_t)max __attribute__((swift_name("peekTo(destination:destinationOffset:offset:min:max:)")));
- (int8_t)readByte __attribute__((swift_name("readByte()")));
- (NSString *)readTextMin:(int32_t)min max:(int32_t)max __attribute__((swift_name("readText(min:max:)")));
- (int32_t)readTextOut:(id<MsdkCoreKotlinAppendable>)out min:(int32_t)min max:(int32_t)max __attribute__((swift_name("readText(out:min:max:)")));
- (NSString *)readTextExactExactCharacters:(int32_t)exactCharacters __attribute__((swift_name("readTextExact(exactCharacters:)")));
- (void)readTextExactOut:(id<MsdkCoreKotlinAppendable>)out exactCharacters:(int32_t)exactCharacters __attribute__((swift_name("readTextExact(out:exactCharacters:)")));
- (void)release_ __attribute__((swift_name("release()")));
- (int32_t)tryPeek __attribute__((swift_name("tryPeek()")));
@property (readonly) BOOL endOfInput __attribute__((swift_name("endOfInput")));
@property (readonly) id<MsdkCoreKtor_ioObjectPool> pool __attribute__((swift_name("pool")));
@property (readonly) int64_t remaining __attribute__((swift_name("remaining")));
@end

__attribute__((swift_name("Ktor_httpOutgoingContent")))
@interface MsdkCoreKtor_httpOutgoingContent : MsdkCoreBase
- (id _Nullable)getPropertyKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key __attribute__((swift_name("getProperty(key:)")));
- (void)setPropertyKey:(MsdkCoreKtor_utilsAttributeKey<id> *)key value:(id _Nullable)value __attribute__((swift_name("setProperty(key:value:)")));
- (id<MsdkCoreKtor_httpHeaders> _Nullable)trailers __attribute__((swift_name("trailers()")));
@property (readonly) MsdkCoreLong * _Nullable contentLength __attribute__((swift_name("contentLength")));
@property (readonly) MsdkCoreKtor_httpContentType * _Nullable contentType __attribute__((swift_name("contentType")));
@property (readonly) id<MsdkCoreKtor_httpHeaders> headers __attribute__((swift_name("headers")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode * _Nullable status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHeaderValueParam")))
@interface MsdkCoreKtor_httpHeaderValueParam : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name value:(NSString *)value __attribute__((swift_name("init(name:value:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name value:(NSString *)value escapeValue:(BOOL)escapeValue __attribute__((swift_name("init(name:value:escapeValue:)"))) __attribute__((objc_designated_initializer));
- (MsdkCoreKtor_httpHeaderValueParam *)doCopyName:(NSString *)name value:(NSString *)value escapeValue:(BOOL)escapeValue __attribute__((swift_name("doCopy(name:value:escapeValue:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL escapeValue __attribute__((swift_name("escapeValue")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHeaderValueWithParameters.Companion")))
@interface MsdkCoreKtor_httpHeaderValueWithParametersCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpHeaderValueWithParametersCompanion *shared __attribute__((swift_name("shared")));
- (id _Nullable)parseValue:(NSString *)value init:(id _Nullable (^)(NSString *, NSArray<MsdkCoreKtor_httpHeaderValueParam *> *))init __attribute__((swift_name("parse(value:init:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpContentType.Companion")))
@interface MsdkCoreKtor_httpContentTypeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpContentTypeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_httpContentType *)parseValue:(NSString *)value __attribute__((swift_name("parse(value:)")));
@property (readonly) MsdkCoreKtor_httpContentType *Any __attribute__((swift_name("Any")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerializersModuleCollector")))
@protocol MsdkCoreKotlinx_serialization_coreSerializersModuleCollector
@required
- (void)contextualKClass:(id<MsdkCoreKotlinKClass>)kClass provider:(id<MsdkCoreKotlinx_serialization_coreKSerializer> (^)(NSArray<id<MsdkCoreKotlinx_serialization_coreKSerializer>> *))provider __attribute__((swift_name("contextual(kClass:provider:)")));
- (void)contextualKClass:(id<MsdkCoreKotlinKClass>)kClass serializer:(id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("contextual(kClass:serializer:)")));
- (void)polymorphicBaseClass:(id<MsdkCoreKotlinKClass>)baseClass actualClass:(id<MsdkCoreKotlinKClass>)actualClass actualSerializer:(id<MsdkCoreKotlinx_serialization_coreKSerializer>)actualSerializer __attribute__((swift_name("polymorphic(baseClass:actualClass:actualSerializer:)")));
- (void)polymorphicDefaultBaseClass:(id<MsdkCoreKotlinKClass>)baseClass defaultDeserializerProvider:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefault(baseClass:defaultDeserializerProvider:)"))) __attribute__((deprecated("Deprecated in favor of function with more precise name: polymorphicDefaultDeserializer")));
- (void)polymorphicDefaultDeserializerBaseClass:(id<MsdkCoreKotlinKClass>)baseClass defaultDeserializerProvider:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefaultDeserializer(baseClass:defaultDeserializerProvider:)")));
- (void)polymorphicDefaultSerializerBaseClass:(id<MsdkCoreKotlinKClass>)baseClass defaultSerializerProvider:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy> _Nullable (^)(id))defaultSerializerProvider __attribute__((swift_name("polymorphicDefaultSerializer(baseClass:defaultSerializerProvider:)")));
@end

__attribute__((swift_name("KotlinKDeclarationContainer")))
@protocol MsdkCoreKotlinKDeclarationContainer
@required
@end

__attribute__((swift_name("KotlinKAnnotatedElement")))
@protocol MsdkCoreKotlinKAnnotatedElement
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((swift_name("KotlinKClassifier")))
@protocol MsdkCoreKotlinKClassifier
@required
@end

__attribute__((swift_name("KotlinKClass")))
@protocol MsdkCoreKotlinKClass <MsdkCoreKotlinKDeclarationContainer, MsdkCoreKotlinKAnnotatedElement, MsdkCoreKotlinKClassifier>
@required

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
- (BOOL)isInstanceValue:(id _Nullable)value __attribute__((swift_name("isInstance(value:)")));
@property (readonly) NSString * _Nullable qualifiedName __attribute__((swift_name("qualifiedName")));
@property (readonly) NSString * _Nullable simpleName __attribute__((swift_name("simpleName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Kotlinx_serialization_jsonJsonElement.Companion")))
@interface MsdkCoreKotlinx_serialization_jsonJsonElementCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinx_serialization_jsonJsonElementCompanion *shared __attribute__((swift_name("shared")));
- (id<MsdkCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_jsonJsonNamingStrategy")))
@protocol MsdkCoreKotlinx_serialization_jsonJsonNamingStrategy
@required
- (NSString *)serialNameForJsonDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor elementIndex:(int32_t)elementIndex serialName:(NSString *)serialName __attribute__((swift_name("serialNameForJson(descriptor:elementIndex:serialName:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeEncoder")))
@protocol MsdkCoreKotlinx_serialization_coreCompositeEncoder
@required
- (void)encodeBooleanElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(BOOL)value __attribute__((swift_name("encodeBooleanElement(descriptor:index:value:)")));
- (void)encodeByteElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int8_t)value __attribute__((swift_name("encodeByteElement(descriptor:index:value:)")));
- (void)encodeCharElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(unichar)value __attribute__((swift_name("encodeCharElement(descriptor:index:value:)")));
- (void)encodeDoubleElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(double)value __attribute__((swift_name("encodeDoubleElement(descriptor:index:value:)")));
- (void)encodeFloatElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(float)value __attribute__((swift_name("encodeFloatElement(descriptor:index:value:)")));
- (id<MsdkCoreKotlinx_serialization_coreEncoder>)encodeInlineElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("encodeInlineElement(descriptor:index:)")));
- (void)encodeIntElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int32_t)value __attribute__((swift_name("encodeIntElement(descriptor:index:value:)")));
- (void)encodeLongElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int64_t)value __attribute__((swift_name("encodeLongElement(descriptor:index:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeSerializableElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<MsdkCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeShortElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int16_t)value __attribute__((swift_name("encodeShortElement(descriptor:index:value:)")));
- (void)encodeStringElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(NSString *)value __attribute__((swift_name("encodeStringElement(descriptor:index:value:)")));
- (void)endStructureDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)shouldEncodeElementDefaultDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("shouldEncodeElementDefault(descriptor:index:)")));
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("KotlinAnnotation")))
@protocol MsdkCoreKotlinAnnotation
@required
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerialKind")))
@interface MsdkCoreKotlinx_serialization_coreSerialKind : MsdkCoreBase
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeDecoder")))
@protocol MsdkCoreKotlinx_serialization_coreCompositeDecoder
@required
- (BOOL)decodeBooleanElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeBooleanElement(descriptor:index:)")));
- (int8_t)decodeByteElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeByteElement(descriptor:index:)")));
- (unichar)decodeCharElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeCharElement(descriptor:index:)")));
- (int32_t)decodeCollectionSizeDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeCollectionSize(descriptor:)")));
- (double)decodeDoubleElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeDoubleElement(descriptor:index:)")));
- (int32_t)decodeElementIndexDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeElementIndex(descriptor:)")));
- (float)decodeFloatElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeFloatElement(descriptor:index:)")));
- (id<MsdkCoreKotlinx_serialization_coreDecoder>)decodeInlineElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeInlineElement(descriptor:index:)")));
- (int32_t)decodeIntElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeIntElement(descriptor:index:)")));
- (int64_t)decodeLongElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeLongElement(descriptor:index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeNullableSerializableElement(descriptor:index:deserializer:previousValue:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeSequentially __attribute__((swift_name("decodeSequentially()")));
- (id _Nullable)decodeSerializableElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<MsdkCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeSerializableElement(descriptor:index:deserializer:previousValue:)")));
- (int16_t)decodeShortElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeShortElement(descriptor:index:)")));
- (NSString *)decodeStringElementDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeStringElement(descriptor:index:)")));
- (void)endStructureDescriptor:(id<MsdkCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));
@property (readonly) MsdkCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinNothing")))
@interface MsdkCoreKotlinNothing : MsdkCoreBase
@end

__attribute__((swift_name("KotlinRuntimeException")))
@interface MsdkCoreKotlinRuntimeException : MsdkCoreKotlinException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("KotlinIllegalStateException")))
@interface MsdkCoreKotlinIllegalStateException : MsdkCoreKotlinRuntimeException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.4")
*/
__attribute__((swift_name("KotlinCancellationException")))
@interface MsdkCoreKotlinCancellationException : MsdkCoreKotlinIllegalStateException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpRequestData")))
@interface MsdkCoreKtor_client_coreHttpRequestData : MsdkCoreBase
- (instancetype)initWithUrl:(MsdkCoreKtor_httpUrl *)url method:(MsdkCoreKtor_httpHttpMethod *)method headers:(id<MsdkCoreKtor_httpHeaders>)headers body:(MsdkCoreKtor_httpOutgoingContent *)body executionContext:(id<MsdkCoreKotlinx_coroutines_coreJob>)executionContext attributes:(id<MsdkCoreKtor_utilsAttributes>)attributes __attribute__((swift_name("init(url:method:headers:body:executionContext:attributes:)"))) __attribute__((objc_designated_initializer));
- (id _Nullable)getCapabilityOrNullKey:(id<MsdkCoreKtor_client_coreHttpClientEngineCapability>)key __attribute__((swift_name("getCapabilityOrNull(key:)")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property (readonly) MsdkCoreKtor_httpOutgoingContent *body __attribute__((swift_name("body")));
@property (readonly) id<MsdkCoreKotlinx_coroutines_coreJob> executionContext __attribute__((swift_name("executionContext")));
@property (readonly) id<MsdkCoreKtor_httpHeaders> headers __attribute__((swift_name("headers")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *method __attribute__((swift_name("method")));
@property (readonly) MsdkCoreKtor_httpUrl *url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpResponseData")))
@interface MsdkCoreKtor_client_coreHttpResponseData : MsdkCoreBase
- (instancetype)initWithStatusCode:(MsdkCoreKtor_httpHttpStatusCode *)statusCode requestTime:(MsdkCoreKtor_utilsGMTDate *)requestTime headers:(id<MsdkCoreKtor_httpHeaders>)headers version:(MsdkCoreKtor_httpHttpProtocolVersion *)version body:(id)body callContext:(id<MsdkCoreKotlinCoroutineContext>)callContext __attribute__((swift_name("init(statusCode:requestTime:headers:version:body:callContext:)"))) __attribute__((objc_designated_initializer));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) id body __attribute__((swift_name("body")));
@property (readonly) id<MsdkCoreKotlinCoroutineContext> callContext __attribute__((swift_name("callContext")));
@property (readonly) id<MsdkCoreKtor_httpHeaders> headers __attribute__((swift_name("headers")));
@property (readonly) MsdkCoreKtor_utilsGMTDate *requestTime __attribute__((swift_name("requestTime")));
@property (readonly) MsdkCoreKtor_utilsGMTDate *responseTime __attribute__((swift_name("responseTime")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *statusCode __attribute__((swift_name("statusCode")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *version __attribute__((swift_name("version")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreProxyConfig")))
@interface MsdkCoreKtor_client_coreProxyConfig : MsdkCoreBase
- (instancetype)initWithUrl:(MsdkCoreKtor_httpUrl *)url __attribute__((swift_name("init(url:)"))) __attribute__((objc_designated_initializer));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) MsdkCoreKtor_httpUrl *url __attribute__((swift_name("url")));
@end

__attribute__((swift_name("Ktor_eventsEventDefinition")))
@interface MsdkCoreKtor_eventsEventDefinition<T> : MsdkCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreDisposableHandle")))
@protocol MsdkCoreKotlinx_coroutines_coreDisposableHandle
@required
- (void)dispose __attribute__((swift_name("dispose()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsPipelinePhase")))
@interface MsdkCoreKtor_utilsPipelinePhase : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((swift_name("KotlinFunction")))
@protocol MsdkCoreKotlinFunction
@required
@end

__attribute__((swift_name("KotlinSuspendFunction2")))
@protocol MsdkCoreKotlinSuspendFunction2 <MsdkCoreKotlinFunction>
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)invokeP1:(id _Nullable)p1 p2:(id _Nullable)p2 completionHandler:(void (^)(id _Nullable_result, NSError * _Nullable))completionHandler __attribute__((swift_name("invoke(p1:p2:completionHandler:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpReceivePipeline.Phases")))
@interface MsdkCoreKtor_client_coreHttpReceivePipelinePhases : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)phases __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpReceivePipelinePhases *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *After __attribute__((swift_name("After")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Before __attribute__((swift_name("Before")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *State __attribute__((swift_name("State")));
@end

__attribute__((swift_name("Ktor_httpHttpMessage")))
@protocol MsdkCoreKtor_httpHttpMessage
@required
@property (readonly) id<MsdkCoreKtor_httpHeaders> headers __attribute__((swift_name("headers")));
@end

__attribute__((swift_name("Ktor_client_coreHttpResponse")))
@interface MsdkCoreKtor_client_coreHttpResponse : MsdkCoreBase <MsdkCoreKtor_httpHttpMessage, MsdkCoreKotlinx_coroutines_coreCoroutineScope>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) MsdkCoreKtor_client_coreHttpClientCall *call __attribute__((swift_name("call")));
@property (readonly) id<MsdkCoreKtor_ioByteReadChannel> content __attribute__((swift_name("content")));
@property (readonly) MsdkCoreKtor_utilsGMTDate *requestTime __attribute__((swift_name("requestTime")));
@property (readonly) MsdkCoreKtor_utilsGMTDate *responseTime __attribute__((swift_name("responseTime")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *status __attribute__((swift_name("status")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *version __attribute__((swift_name("version")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinUnit")))
@interface MsdkCoreKotlinUnit : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)unit __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinUnit *shared __attribute__((swift_name("shared")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpRequestPipeline.Phases")))
@interface MsdkCoreKtor_client_coreHttpRequestPipelinePhases : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)phases __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpRequestPipelinePhases *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Before __attribute__((swift_name("Before")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Render __attribute__((swift_name("Render")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Send __attribute__((swift_name("Send")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *State __attribute__((swift_name("State")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Transform __attribute__((swift_name("Transform")));
@end

__attribute__((swift_name("Ktor_httpHttpMessageBuilder")))
@protocol MsdkCoreKtor_httpHttpMessageBuilder
@required
@property (readonly) MsdkCoreKtor_httpHeadersBuilder *headers __attribute__((swift_name("headers")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpRequestBuilder")))
@interface MsdkCoreKtor_client_coreHttpRequestBuilder : MsdkCoreBase <MsdkCoreKtor_httpHttpMessageBuilder>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpRequestBuilderCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_client_coreHttpRequestData *)build __attribute__((swift_name("build()")));
- (id _Nullable)getCapabilityOrNullKey:(id<MsdkCoreKtor_client_coreHttpClientEngineCapability>)key __attribute__((swift_name("getCapabilityOrNull(key:)")));
- (void)setAttributesBlock:(void (^)(id<MsdkCoreKtor_utilsAttributes>))block __attribute__((swift_name("setAttributes(block:)")));
- (void)setCapabilityKey:(id<MsdkCoreKtor_client_coreHttpClientEngineCapability>)key capability:(id)capability __attribute__((swift_name("setCapability(key:capability:)")));
- (MsdkCoreKtor_client_coreHttpRequestBuilder *)takeFromBuilder:(MsdkCoreKtor_client_coreHttpRequestBuilder *)builder __attribute__((swift_name("takeFrom(builder:)")));
- (MsdkCoreKtor_client_coreHttpRequestBuilder *)takeFromWithExecutionContextBuilder:(MsdkCoreKtor_client_coreHttpRequestBuilder *)builder __attribute__((swift_name("takeFromWithExecutionContext(builder:)")));
- (void)urlBlock:(void (^)(MsdkCoreKtor_httpURLBuilder *, MsdkCoreKtor_httpURLBuilder *))block __attribute__((swift_name("url(block:)")));
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property id body __attribute__((swift_name("body")));
@property MsdkCoreKtor_utilsTypeInfo * _Nullable bodyType __attribute__((swift_name("bodyType")));
@property (readonly) id<MsdkCoreKotlinx_coroutines_coreJob> executionContext __attribute__((swift_name("executionContext")));
@property (readonly) MsdkCoreKtor_httpHeadersBuilder *headers __attribute__((swift_name("headers")));
@property MsdkCoreKtor_httpHttpMethod *method __attribute__((swift_name("method")));
@property (readonly) MsdkCoreKtor_httpURLBuilder *url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpResponsePipeline.Phases")))
@interface MsdkCoreKtor_client_coreHttpResponsePipelinePhases : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)phases __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpResponsePipelinePhases *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *After __attribute__((swift_name("After")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Parse __attribute__((swift_name("Parse")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Receive __attribute__((swift_name("Receive")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *State __attribute__((swift_name("State")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Transform __attribute__((swift_name("Transform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpResponseContainer")))
@interface MsdkCoreKtor_client_coreHttpResponseContainer : MsdkCoreBase
- (instancetype)initWithExpectedType:(MsdkCoreKtor_utilsTypeInfo *)expectedType response:(id)response __attribute__((swift_name("init(expectedType:response:)"))) __attribute__((objc_designated_initializer));
- (MsdkCoreKtor_client_coreHttpResponseContainer *)doCopyExpectedType:(MsdkCoreKtor_utilsTypeInfo *)expectedType response:(id)response __attribute__((swift_name("doCopy(expectedType:response:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) MsdkCoreKtor_utilsTypeInfo *expectedType __attribute__((swift_name("expectedType")));
@property (readonly) id response __attribute__((swift_name("response")));
@end

__attribute__((swift_name("Ktor_client_coreHttpClientCall")))
@interface MsdkCoreKtor_client_coreHttpClientCall : MsdkCoreBase <MsdkCoreKotlinx_coroutines_coreCoroutineScope>
- (instancetype)initWithClient:(MsdkCoreKtor_client_coreHttpClient *)client __attribute__((swift_name("init(client:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithClient:(MsdkCoreKtor_client_coreHttpClient *)client requestData:(MsdkCoreKtor_client_coreHttpRequestData *)requestData responseData:(MsdkCoreKtor_client_coreHttpResponseData *)responseData __attribute__((swift_name("init(client:requestData:responseData:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_client_coreHttpClientCallCompanion *companion __attribute__((swift_name("companion")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)bodyInfo:(MsdkCoreKtor_utilsTypeInfo *)info completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("body(info:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)bodyNullableInfo:(MsdkCoreKtor_utilsTypeInfo *)info completionHandler:(void (^)(id _Nullable_result, NSError * _Nullable))completionHandler __attribute__((swift_name("bodyNullable(info:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)getResponseContentWithCompletionHandler:(void (^)(id<MsdkCoreKtor_ioByteReadChannel> _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("getResponseContent(completionHandler:)")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note This property has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
@property (readonly) BOOL allowDoubleReceive __attribute__((swift_name("allowDoubleReceive")));
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property (readonly) MsdkCoreKtor_client_coreHttpClient *client __attribute__((swift_name("client")));
@property (readonly) id<MsdkCoreKotlinCoroutineContext> coroutineContext __attribute__((swift_name("coroutineContext")));
@property id<MsdkCoreKtor_client_coreHttpRequest> request __attribute__((swift_name("request")));
@property MsdkCoreKtor_client_coreHttpResponse *response __attribute__((swift_name("response")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpSendPipeline.Phases")))
@interface MsdkCoreKtor_client_coreHttpSendPipelinePhases : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)phases __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpSendPipelinePhases *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Before __attribute__((swift_name("Before")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Engine __attribute__((swift_name("Engine")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Monitoring __attribute__((swift_name("Monitoring")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *Receive __attribute__((swift_name("Receive")));
@property (readonly) MsdkCoreKtor_utilsPipelinePhase *State __attribute__((swift_name("State")));
@end

__attribute__((swift_name("KotlinKType")))
@protocol MsdkCoreKotlinKType
@required

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
@property (readonly) NSArray<MsdkCoreKotlinKTypeProjection *> *arguments __attribute__((swift_name("arguments")));

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
@property (readonly) id<MsdkCoreKotlinKClassifier> _Nullable classifier __attribute__((swift_name("classifier")));
@property (readonly) BOOL isMarkedNullable __attribute__((swift_name("isMarkedNullable")));
@end

__attribute__((swift_name("Ktor_ioBuffer")))
@interface MsdkCoreKtor_ioBuffer : MsdkCoreBase
- (instancetype)initWithMemory:(MsdkCoreKtor_ioMemory *)memory __attribute__((swift_name("init(memory:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_ioBufferCompanion *companion __attribute__((swift_name("companion")));
- (void)commitWrittenCount:(int32_t)count __attribute__((swift_name("commitWritten(count:)")));
- (void)discardExactCount:(int32_t)count __attribute__((swift_name("discardExact(count:)")));
- (MsdkCoreKtor_ioBuffer *)duplicate __attribute__((swift_name("duplicate()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)duplicateToCopy:(MsdkCoreKtor_ioBuffer *)copy __attribute__((swift_name("duplicateTo(copy:)")));
- (int8_t)readByte __attribute__((swift_name("readByte()")));
- (void)reserveEndGapEndGap:(int32_t)endGap __attribute__((swift_name("reserveEndGap(endGap:)")));
- (void)reserveStartGapStartGap:(int32_t)startGap __attribute__((swift_name("reserveStartGap(startGap:)")));
- (void)reset __attribute__((swift_name("reset()")));
- (void)resetForRead __attribute__((swift_name("resetForRead()")));
- (void)resetForWrite __attribute__((swift_name("resetForWrite()")));
- (void)resetForWriteLimit:(int32_t)limit __attribute__((swift_name("resetForWrite(limit:)")));
- (void)rewindCount:(int32_t)count __attribute__((swift_name("rewind(count:)")));
- (NSString *)description __attribute__((swift_name("description()")));
- (int32_t)tryPeekByte __attribute__((swift_name("tryPeekByte()")));
- (int32_t)tryReadByte __attribute__((swift_name("tryReadByte()")));
- (void)writeByteValue:(int8_t)value __attribute__((swift_name("writeByte(value:)")));
@property (readonly) int32_t capacity __attribute__((swift_name("capacity")));
@property (readonly) int32_t endGap __attribute__((swift_name("endGap")));
@property (readonly) int32_t limit __attribute__((swift_name("limit")));
@property (readonly) MsdkCoreKtor_ioMemory *memory __attribute__((swift_name("memory")));
@property (readonly) int32_t readPosition __attribute__((swift_name("readPosition")));
@property (readonly) int32_t readRemaining __attribute__((swift_name("readRemaining")));
@property (readonly) int32_t startGap __attribute__((swift_name("startGap")));
@property (readonly) int32_t writePosition __attribute__((swift_name("writePosition")));
@property (readonly) int32_t writeRemaining __attribute__((swift_name("writeRemaining")));
@end

__attribute__((swift_name("Ktor_ioChunkBuffer")))
@interface MsdkCoreKtor_ioChunkBuffer : MsdkCoreKtor_ioBuffer
- (instancetype)initWithMemory:(MsdkCoreKtor_ioMemory *)memory origin:(MsdkCoreKtor_ioChunkBuffer * _Nullable)origin parentPool:(id<MsdkCoreKtor_ioObjectPool> _Nullable)parentPool __attribute__((swift_name("init(memory:origin:parentPool:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMemory:(MsdkCoreKtor_ioMemory *)memory __attribute__((swift_name("init(memory:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_ioChunkBufferCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_ioChunkBuffer * _Nullable)cleanNext __attribute__((swift_name("cleanNext()")));
- (MsdkCoreKtor_ioChunkBuffer *)duplicate __attribute__((swift_name("duplicate()")));
- (void)releasePool:(id<MsdkCoreKtor_ioObjectPool>)pool __attribute__((swift_name("release(pool:)")));
- (void)reset __attribute__((swift_name("reset()")));
@property (getter=next_) MsdkCoreKtor_ioChunkBuffer * _Nullable next __attribute__((swift_name("next")));
@property (readonly) MsdkCoreKtor_ioChunkBuffer * _Nullable origin __attribute__((swift_name("origin")));
@property (readonly) int32_t referenceCount __attribute__((swift_name("referenceCount")));
@end

__attribute__((swift_name("Ktor_ioObjectPool")))
@protocol MsdkCoreKtor_ioObjectPool <MsdkCoreKtor_ioCloseable>
@required
- (id)borrow __attribute__((swift_name("borrow()")));
- (void)dispose __attribute__((swift_name("dispose()")));
- (void)recycleInstance:(id)instance __attribute__((swift_name("recycle(instance:)")));
@property (readonly) int32_t capacity __attribute__((swift_name("capacity")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioInput.Companion")))
@interface MsdkCoreKtor_ioInputCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_ioInputCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioMemory")))
@interface MsdkCoreKtor_ioMemory : MsdkCoreBase
- (instancetype)initWithPointer:(void *)pointer size:(int64_t)size __attribute__((swift_name("init(pointer:size:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_ioMemoryCompanion *companion __attribute__((swift_name("companion")));
- (void)doCopyToDestination:(MsdkCoreKtor_ioMemory *)destination offset:(int32_t)offset length:(int32_t)length destinationOffset:(int32_t)destinationOffset __attribute__((swift_name("doCopyTo(destination:offset:length:destinationOffset:)")));
- (void)doCopyToDestination:(MsdkCoreKtor_ioMemory *)destination offset:(int64_t)offset length:(int64_t)length destinationOffset_:(int64_t)destinationOffset __attribute__((swift_name("doCopyTo(destination:offset:length:destinationOffset_:)")));
- (int8_t)loadAtIndex:(int32_t)index __attribute__((swift_name("loadAt(index:)")));
- (int8_t)loadAtIndex_:(int64_t)index __attribute__((swift_name("loadAt(index_:)")));
- (MsdkCoreKtor_ioMemory *)sliceOffset:(int32_t)offset length:(int32_t)length __attribute__((swift_name("slice(offset:length:)")));
- (MsdkCoreKtor_ioMemory *)sliceOffset:(int64_t)offset length_:(int64_t)length __attribute__((swift_name("slice(offset:length_:)")));
- (void)storeAtIndex:(int32_t)index value:(int8_t)value __attribute__((swift_name("storeAt(index:value:)")));
- (void)storeAtIndex:(int64_t)index value_:(int8_t)value __attribute__((swift_name("storeAt(index:value_:)")));
@property (readonly) void *pointer __attribute__((swift_name("pointer")));
@property (readonly) int64_t size __attribute__((swift_name("size")));
@property (readonly) int32_t size32 __attribute__((swift_name("size32")));
@end

__attribute__((swift_name("KotlinAppendable")))
@protocol MsdkCoreKotlinAppendable
@required
- (id<MsdkCoreKotlinAppendable>)appendValue:(unichar)value __attribute__((swift_name("append(value:)")));
- (id<MsdkCoreKotlinAppendable>)appendValue_:(id _Nullable)value __attribute__((swift_name("append(value_:)")));
- (id<MsdkCoreKotlinAppendable>)appendValue:(id _Nullable)value startIndex:(int32_t)startIndex endIndex:(int32_t)endIndex __attribute__((swift_name("append(value:startIndex:endIndex:)")));
@end

__attribute__((swift_name("Ktor_utilsStringValues")))
@protocol MsdkCoreKtor_utilsStringValues
@required
- (BOOL)containsName:(NSString *)name __attribute__((swift_name("contains(name:)")));
- (BOOL)containsName:(NSString *)name value:(NSString *)value __attribute__((swift_name("contains(name:value:)")));
- (NSSet<id<MsdkCoreKotlinMapEntry>> *)entries __attribute__((swift_name("entries()")));
- (void)forEachBody:(void (^)(NSString *, NSArray<NSString *> *))body __attribute__((swift_name("forEach(body:)")));
- (NSString * _Nullable)getName:(NSString *)name __attribute__((swift_name("get(name:)")));
- (NSArray<NSString *> * _Nullable)getAllName:(NSString *)name __attribute__((swift_name("getAll(name:)")));
- (BOOL)isEmpty_ __attribute__((swift_name("isEmpty()")));
- (NSSet<NSString *> *)names __attribute__((swift_name("names()")));
@property (readonly) BOOL caseInsensitiveName __attribute__((swift_name("caseInsensitiveName")));
@end

__attribute__((swift_name("Ktor_httpHeaders")))
@protocol MsdkCoreKtor_httpHeaders <MsdkCoreKtor_utilsStringValues>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpStatusCode")))
@interface MsdkCoreKtor_httpHttpStatusCode : MsdkCoreBase <MsdkCoreKotlinComparable>
- (instancetype)initWithValue:(int32_t)value description:(NSString *)description __attribute__((swift_name("init(value:description:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpHttpStatusCodeCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)compareToOther:(MsdkCoreKtor_httpHttpStatusCode *)other __attribute__((swift_name("compareTo(other:)")));
- (MsdkCoreKtor_httpHttpStatusCode *)doCopyValue:(int32_t)value description:(NSString *)description __attribute__((swift_name("doCopy(value:description:)")));
- (MsdkCoreKtor_httpHttpStatusCode *)descriptionValue:(NSString *)value __attribute__((swift_name("description(value:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *description_ __attribute__((swift_name("description_")));
@property (readonly) int32_t value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpUrl")))
@interface MsdkCoreKtor_httpUrl : MsdkCoreBase
@property (class, readonly, getter=companion) MsdkCoreKtor_httpUrlCompanion *companion __attribute__((swift_name("companion")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *encodedFragment __attribute__((swift_name("encodedFragment")));
@property (readonly) NSString * _Nullable encodedPassword __attribute__((swift_name("encodedPassword")));
@property (readonly) NSString *encodedPath __attribute__((swift_name("encodedPath")));
@property (readonly) NSString *encodedPathAndQuery __attribute__((swift_name("encodedPathAndQuery")));
@property (readonly) NSString *encodedQuery __attribute__((swift_name("encodedQuery")));
@property (readonly) NSString * _Nullable encodedUser __attribute__((swift_name("encodedUser")));
@property (readonly) NSString *fragment __attribute__((swift_name("fragment")));
@property (readonly) NSString *host __attribute__((swift_name("host")));
@property (readonly) id<MsdkCoreKtor_httpParameters> parameters __attribute__((swift_name("parameters")));
@property (readonly) NSString * _Nullable password __attribute__((swift_name("password")));
@property (readonly) NSArray<NSString *> *pathSegments __attribute__((swift_name("pathSegments")));
@property (readonly) int32_t port __attribute__((swift_name("port")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *protocol __attribute__((swift_name("protocol")));
@property (readonly) int32_t specifiedPort __attribute__((swift_name("specifiedPort")));
@property (readonly) BOOL trailingQuery __attribute__((swift_name("trailingQuery")));
@property (readonly) NSString * _Nullable user __attribute__((swift_name("user")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpMethod")))
@interface MsdkCoreKtor_httpHttpMethod : MsdkCoreBase
- (instancetype)initWithValue:(NSString *)value __attribute__((swift_name("init(value:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpHttpMethodCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_httpHttpMethod *)doCopyValue:(NSString *)value __attribute__((swift_name("doCopy(value:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreJob")))
@protocol MsdkCoreKotlinx_coroutines_coreJob <MsdkCoreKotlinCoroutineContextElement>
@required
- (id<MsdkCoreKotlinx_coroutines_coreChildHandle>)attachChildChild:(id<MsdkCoreKotlinx_coroutines_coreChildJob>)child __attribute__((swift_name("attachChild(child:)")));
- (void)cancelCause:(MsdkCoreKotlinCancellationException * _Nullable)cause __attribute__((swift_name("cancel(cause:)")));
- (MsdkCoreKotlinCancellationException *)getCancellationException __attribute__((swift_name("getCancellationException()")));
- (id<MsdkCoreKotlinx_coroutines_coreDisposableHandle>)invokeOnCompletionHandler:(void (^)(MsdkCoreKotlinThrowable * _Nullable))handler __attribute__((swift_name("invokeOnCompletion(handler:)")));
- (id<MsdkCoreKotlinx_coroutines_coreDisposableHandle>)invokeOnCompletionOnCancelling:(BOOL)onCancelling invokeImmediately:(BOOL)invokeImmediately handler:(void (^)(MsdkCoreKotlinThrowable * _Nullable))handler __attribute__((swift_name("invokeOnCompletion(onCancelling:invokeImmediately:handler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)joinWithCompletionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("join(completionHandler:)")));
- (id<MsdkCoreKotlinx_coroutines_coreJob>)plusOther_:(id<MsdkCoreKotlinx_coroutines_coreJob>)other __attribute__((swift_name("plus(other_:)"))) __attribute__((unavailable("Operator '+' on two Job objects is meaningless. Job is a coroutine context element and `+` is a set-sum operator for coroutine contexts. The job to the right of `+` just replaces the job the left of `+`.")));
- (BOOL)start __attribute__((swift_name("start()")));
@property (readonly) id<MsdkCoreKotlinSequence> children __attribute__((swift_name("children")));
@property (readonly) BOOL isActive __attribute__((swift_name("isActive")));
@property (readonly) BOOL isCancelled __attribute__((swift_name("isCancelled")));
@property (readonly) BOOL isCompleted __attribute__((swift_name("isCompleted")));
@property (readonly) id<MsdkCoreKotlinx_coroutines_coreSelectClause0> onJoin __attribute__((swift_name("onJoin")));

/**
 * @note annotations
 *   kotlinx.coroutines.ExperimentalCoroutinesApi
*/
@property (readonly) id<MsdkCoreKotlinx_coroutines_coreJob> _Nullable parent __attribute__((swift_name("parent")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsGMTDate")))
@interface MsdkCoreKtor_utilsGMTDate : MsdkCoreBase <MsdkCoreKotlinComparable>
@property (class, readonly, getter=companion) MsdkCoreKtor_utilsGMTDateCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)compareToOther:(MsdkCoreKtor_utilsGMTDate *)other __attribute__((swift_name("compareTo(other:)")));
- (MsdkCoreKtor_utilsGMTDate *)doCopySeconds:(int32_t)seconds minutes:(int32_t)minutes hours:(int32_t)hours dayOfWeek:(MsdkCoreKtor_utilsWeekDay *)dayOfWeek dayOfMonth:(int32_t)dayOfMonth dayOfYear:(int32_t)dayOfYear month:(MsdkCoreKtor_utilsMonth *)month year:(int32_t)year timestamp:(int64_t)timestamp __attribute__((swift_name("doCopy(seconds:minutes:hours:dayOfWeek:dayOfMonth:dayOfYear:month:year:timestamp:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) int32_t dayOfMonth __attribute__((swift_name("dayOfMonth")));
@property (readonly) MsdkCoreKtor_utilsWeekDay *dayOfWeek __attribute__((swift_name("dayOfWeek")));
@property (readonly) int32_t dayOfYear __attribute__((swift_name("dayOfYear")));
@property (readonly) int32_t hours __attribute__((swift_name("hours")));
@property (readonly) int32_t minutes __attribute__((swift_name("minutes")));
@property (readonly) MsdkCoreKtor_utilsMonth *month __attribute__((swift_name("month")));
@property (readonly) int32_t seconds __attribute__((swift_name("seconds")));
@property (readonly) int64_t timestamp __attribute__((swift_name("timestamp")));
@property (readonly) int32_t year __attribute__((swift_name("year")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpProtocolVersion")))
@interface MsdkCoreKtor_httpHttpProtocolVersion : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name major:(int32_t)major minor:(int32_t)minor __attribute__((swift_name("init(name:major:minor:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpHttpProtocolVersionCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_httpHttpProtocolVersion *)doCopyName:(NSString *)name major:(int32_t)major minor:(int32_t)minor __attribute__((swift_name("doCopy(name:major:minor:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) int32_t major __attribute__((swift_name("major")));
@property (readonly) int32_t minor __attribute__((swift_name("minor")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((swift_name("Ktor_ioByteReadChannel")))
@protocol MsdkCoreKtor_ioByteReadChannel
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)awaitContentWithCompletionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("awaitContent(completionHandler:)")));
- (BOOL)cancelCause_:(MsdkCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("cancel(cause_:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)discardMax:(int64_t)max completionHandler:(void (^)(MsdkCoreLong * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("discard(max:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)peekToDestination:(MsdkCoreKtor_ioMemory *)destination destinationOffset:(int64_t)destinationOffset offset:(int64_t)offset min:(int64_t)min max:(int64_t)max completionHandler:(void (^)(MsdkCoreLong * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("peekTo(destination:destinationOffset:offset:min:max:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readAvailableDst:(MsdkCoreKtor_ioChunkBuffer *)dst completionHandler:(void (^)(MsdkCoreInt * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readAvailable(dst:completionHandler:)")));
- (int32_t)readAvailableMin:(int32_t)min block:(void (^)(MsdkCoreKtor_ioBuffer *))block __attribute__((swift_name("readAvailable(min:block:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readAvailableDst:(MsdkCoreKotlinByteArray *)dst offset:(int32_t)offset length:(int32_t)length completionHandler:(void (^)(MsdkCoreInt * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readAvailable(dst:offset:length:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readAvailableDst:(void *)dst offset:(int32_t)offset length:(int32_t)length completionHandler_:(void (^)(MsdkCoreInt * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readAvailable(dst:offset:length:completionHandler_:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readAvailableDst:(void *)dst offset:(int64_t)offset length:(int64_t)length completionHandler__:(void (^)(MsdkCoreInt * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readAvailable(dst:offset:length:completionHandler__:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readBooleanWithCompletionHandler:(void (^)(MsdkCoreBoolean * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readBoolean(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readByteWithCompletionHandler:(void (^)(MsdkCoreByte * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readByte(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readDoubleWithCompletionHandler:(void (^)(MsdkCoreDouble * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readDouble(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readFloatWithCompletionHandler:(void (^)(MsdkCoreFloat * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readFloat(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readFullyDst:(MsdkCoreKtor_ioChunkBuffer *)dst n:(int32_t)n completionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("readFully(dst:n:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readFullyDst:(MsdkCoreKotlinByteArray *)dst offset:(int32_t)offset length:(int32_t)length completionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("readFully(dst:offset:length:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readFullyDst:(void *)dst offset:(int32_t)offset length:(int32_t)length completionHandler_:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("readFully(dst:offset:length:completionHandler_:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readFullyDst:(void *)dst offset:(int64_t)offset length:(int64_t)length completionHandler__:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("readFully(dst:offset:length:completionHandler__:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readIntWithCompletionHandler:(void (^)(MsdkCoreInt * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readInt(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readLongWithCompletionHandler:(void (^)(MsdkCoreLong * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readLong(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readPacketSize:(int32_t)size completionHandler:(void (^)(MsdkCoreKtor_ioByteReadPacket * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readPacket(size:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readRemainingLimit:(int64_t)limit completionHandler:(void (^)(MsdkCoreKtor_ioByteReadPacket * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readRemaining(limit:completionHandler:)")));
- (void)readSessionConsumer:(void (^)(id<MsdkCoreKtor_ioReadSession>))consumer __attribute__((swift_name("readSession(consumer:)"))) __attribute__((deprecated("Use read { } instead.")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readShortWithCompletionHandler:(void (^)(MsdkCoreShort * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readShort(completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readSuspendableSessionConsumer:(id<MsdkCoreKotlinSuspendFunction1>)consumer completionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("readSuspendableSession(consumer:completionHandler:)"))) __attribute__((deprecated("Use read { } instead.")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readUTF8LineLimit:(int32_t)limit completionHandler:(void (^)(NSString * _Nullable_result, NSError * _Nullable))completionHandler __attribute__((swift_name("readUTF8Line(limit:completionHandler:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)readUTF8LineToOut:(id<MsdkCoreKotlinAppendable>)out limit:(int32_t)limit completionHandler:(void (^)(MsdkCoreBoolean * _Nullable, NSError * _Nullable))completionHandler __attribute__((swift_name("readUTF8LineTo(out:limit:completionHandler:)")));
@property (readonly) int32_t availableForRead __attribute__((swift_name("availableForRead")));
@property (readonly) MsdkCoreKotlinThrowable * _Nullable closedCause __attribute__((swift_name("closedCause")));
@property (readonly) BOOL isClosedForRead __attribute__((swift_name("isClosedForRead")));
@property (readonly) BOOL isClosedForWrite __attribute__((swift_name("isClosedForWrite")));
@property (readonly) int64_t totalBytesRead __attribute__((swift_name("totalBytesRead")));
@end

__attribute__((swift_name("Ktor_utilsStringValuesBuilder")))
@protocol MsdkCoreKtor_utilsStringValuesBuilder
@required
- (void)appendName:(NSString *)name value:(NSString *)value __attribute__((swift_name("append(name:value:)")));
- (void)appendAllStringValues:(id<MsdkCoreKtor_utilsStringValues>)stringValues __attribute__((swift_name("appendAll(stringValues:)")));
- (void)appendAllName:(NSString *)name values:(id)values __attribute__((swift_name("appendAll(name:values:)")));
- (void)appendMissingStringValues:(id<MsdkCoreKtor_utilsStringValues>)stringValues __attribute__((swift_name("appendMissing(stringValues:)")));
- (void)appendMissingName:(NSString *)name values:(id)values __attribute__((swift_name("appendMissing(name:values:)")));
- (id<MsdkCoreKtor_utilsStringValues>)build __attribute__((swift_name("build()")));
- (void)clear __attribute__((swift_name("clear()")));
- (BOOL)containsName:(NSString *)name __attribute__((swift_name("contains(name:)")));
- (BOOL)containsName:(NSString *)name value:(NSString *)value __attribute__((swift_name("contains(name:value:)")));
- (NSSet<id<MsdkCoreKotlinMapEntry>> *)entries __attribute__((swift_name("entries()")));
- (NSString * _Nullable)getName:(NSString *)name __attribute__((swift_name("get(name:)")));
- (NSArray<NSString *> * _Nullable)getAllName:(NSString *)name __attribute__((swift_name("getAll(name:)")));
- (BOOL)isEmpty_ __attribute__((swift_name("isEmpty()")));
- (NSSet<NSString *> *)names __attribute__((swift_name("names()")));
- (void)removeName:(NSString *)name __attribute__((swift_name("remove(name:)")));
- (BOOL)removeName:(NSString *)name value:(NSString *)value __attribute__((swift_name("remove(name:value:)")));
- (void)removeKeysWithNoEntries __attribute__((swift_name("removeKeysWithNoEntries()")));
- (void)setName:(NSString *)name value:(NSString *)value __attribute__((swift_name("set(name:value:)")));
@property (readonly) BOOL caseInsensitiveName __attribute__((swift_name("caseInsensitiveName")));
@end

__attribute__((swift_name("Ktor_utilsStringValuesBuilderImpl")))
@interface MsdkCoreKtor_utilsStringValuesBuilderImpl : MsdkCoreBase <MsdkCoreKtor_utilsStringValuesBuilder>
- (instancetype)initWithCaseInsensitiveName:(BOOL)caseInsensitiveName size:(int32_t)size __attribute__((swift_name("init(caseInsensitiveName:size:)"))) __attribute__((objc_designated_initializer));
- (void)appendName:(NSString *)name value:(NSString *)value __attribute__((swift_name("append(name:value:)")));
- (void)appendAllStringValues:(id<MsdkCoreKtor_utilsStringValues>)stringValues __attribute__((swift_name("appendAll(stringValues:)")));
- (void)appendAllName:(NSString *)name values:(id)values __attribute__((swift_name("appendAll(name:values:)")));
- (void)appendMissingStringValues:(id<MsdkCoreKtor_utilsStringValues>)stringValues __attribute__((swift_name("appendMissing(stringValues:)")));
- (void)appendMissingName:(NSString *)name values:(id)values __attribute__((swift_name("appendMissing(name:values:)")));
- (id<MsdkCoreKtor_utilsStringValues>)build __attribute__((swift_name("build()")));
- (void)clear __attribute__((swift_name("clear()")));
- (BOOL)containsName:(NSString *)name __attribute__((swift_name("contains(name:)")));
- (BOOL)containsName:(NSString *)name value:(NSString *)value __attribute__((swift_name("contains(name:value:)")));
- (NSSet<id<MsdkCoreKotlinMapEntry>> *)entries __attribute__((swift_name("entries()")));
- (NSString * _Nullable)getName:(NSString *)name __attribute__((swift_name("get(name:)")));
- (NSArray<NSString *> * _Nullable)getAllName:(NSString *)name __attribute__((swift_name("getAll(name:)")));
- (BOOL)isEmpty_ __attribute__((swift_name("isEmpty()")));
- (NSSet<NSString *> *)names __attribute__((swift_name("names()")));
- (void)removeName:(NSString *)name __attribute__((swift_name("remove(name:)")));
- (BOOL)removeName:(NSString *)name value:(NSString *)value __attribute__((swift_name("remove(name:value:)")));
- (void)removeKeysWithNoEntries __attribute__((swift_name("removeKeysWithNoEntries()")));
- (void)setName:(NSString *)name value:(NSString *)value __attribute__((swift_name("set(name:value:)")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)validateNameName:(NSString *)name __attribute__((swift_name("validateName(name:)")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)validateValueValue:(NSString *)value __attribute__((swift_name("validateValue(value:)")));
@property (readonly) BOOL caseInsensitiveName __attribute__((swift_name("caseInsensitiveName")));

/**
 * @note This property has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
@property (readonly) MsdkCoreMutableDictionary<NSString *, NSMutableArray<NSString *> *> *values __attribute__((swift_name("values")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHeadersBuilder")))
@interface MsdkCoreKtor_httpHeadersBuilder : MsdkCoreKtor_utilsStringValuesBuilderImpl
- (instancetype)initWithSize:(int32_t)size __attribute__((swift_name("init(size:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCaseInsensitiveName:(BOOL)caseInsensitiveName size:(int32_t)size __attribute__((swift_name("init(caseInsensitiveName:size:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (id<MsdkCoreKtor_httpHeaders>)build __attribute__((swift_name("build()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)validateNameName:(NSString *)name __attribute__((swift_name("validateName(name:)")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)validateValueValue:(NSString *)value __attribute__((swift_name("validateValue(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpRequestBuilder.Companion")))
@interface MsdkCoreKtor_client_coreHttpRequestBuilderCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpRequestBuilderCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpURLBuilder")))
@interface MsdkCoreKtor_httpURLBuilder : MsdkCoreBase
- (instancetype)initWithProtocol:(MsdkCoreKtor_httpURLProtocol *)protocol host:(NSString *)host port:(int32_t)port user:(NSString * _Nullable)user password:(NSString * _Nullable)password pathSegments:(NSArray<NSString *> *)pathSegments parameters:(id<MsdkCoreKtor_httpParameters>)parameters fragment:(NSString *)fragment trailingQuery:(BOOL)trailingQuery __attribute__((swift_name("init(protocol:host:port:user:password:pathSegments:parameters:fragment:trailingQuery:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpURLBuilderCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_httpUrl *)build __attribute__((swift_name("build()")));
- (NSString *)buildString __attribute__((swift_name("buildString()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *encodedFragment __attribute__((swift_name("encodedFragment")));
@property id<MsdkCoreKtor_httpParametersBuilder> encodedParameters __attribute__((swift_name("encodedParameters")));
@property NSString * _Nullable encodedPassword __attribute__((swift_name("encodedPassword")));
@property NSArray<NSString *> *encodedPathSegments __attribute__((swift_name("encodedPathSegments")));
@property NSString * _Nullable encodedUser __attribute__((swift_name("encodedUser")));
@property NSString *fragment __attribute__((swift_name("fragment")));
@property NSString *host __attribute__((swift_name("host")));
@property (readonly) id<MsdkCoreKtor_httpParametersBuilder> parameters __attribute__((swift_name("parameters")));
@property NSString * _Nullable password __attribute__((swift_name("password")));
@property NSArray<NSString *> *pathSegments __attribute__((swift_name("pathSegments")));
@property int32_t port __attribute__((swift_name("port")));
@property MsdkCoreKtor_httpURLProtocol *protocol __attribute__((swift_name("protocol")));
@property BOOL trailingQuery __attribute__((swift_name("trailingQuery")));
@property NSString * _Nullable user __attribute__((swift_name("user")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_client_coreHttpClientCall.Companion")))
@interface MsdkCoreKtor_client_coreHttpClientCallCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_client_coreHttpClientCallCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsAttributeKey<id> *CustomResponse __attribute__((swift_name("CustomResponse"))) __attribute__((unavailable("This is going to be removed. Please file a ticket with clarification why and what for do you need it.")));
@end

__attribute__((swift_name("Ktor_client_coreHttpRequest")))
@protocol MsdkCoreKtor_client_coreHttpRequest <MsdkCoreKtor_httpHttpMessage, MsdkCoreKotlinx_coroutines_coreCoroutineScope>
@required
@property (readonly) id<MsdkCoreKtor_utilsAttributes> attributes __attribute__((swift_name("attributes")));
@property (readonly) MsdkCoreKtor_client_coreHttpClientCall *call __attribute__((swift_name("call")));
@property (readonly) MsdkCoreKtor_httpOutgoingContent *content __attribute__((swift_name("content")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *method __attribute__((swift_name("method")));
@property (readonly) MsdkCoreKtor_httpUrl *url __attribute__((swift_name("url")));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinKTypeProjection")))
@interface MsdkCoreKotlinKTypeProjection : MsdkCoreBase
- (instancetype)initWithVariance:(MsdkCoreKotlinKVariance * _Nullable)variance type:(id<MsdkCoreKotlinKType> _Nullable)type __attribute__((swift_name("init(variance:type:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKotlinKTypeProjectionCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKotlinKTypeProjection *)doCopyVariance:(MsdkCoreKotlinKVariance * _Nullable)variance type:(id<MsdkCoreKotlinKType> _Nullable)type __attribute__((swift_name("doCopy(variance:type:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) id<MsdkCoreKotlinKType> _Nullable type __attribute__((swift_name("type")));
@property (readonly) MsdkCoreKotlinKVariance * _Nullable variance __attribute__((swift_name("variance")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioBuffer.Companion")))
@interface MsdkCoreKtor_ioBufferCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_ioBufferCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_ioBuffer *Empty __attribute__((swift_name("Empty")));
@property (readonly) int32_t ReservedSize __attribute__((swift_name("ReservedSize")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioChunkBuffer.Companion")))
@interface MsdkCoreKtor_ioChunkBufferCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_ioChunkBufferCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_ioChunkBuffer *Empty __attribute__((swift_name("Empty")));
@property (readonly) id<MsdkCoreKtor_ioObjectPool> EmptyPool __attribute__((swift_name("EmptyPool")));
@property (readonly) id<MsdkCoreKtor_ioObjectPool> Pool __attribute__((swift_name("Pool")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioMemory.Companion")))
@interface MsdkCoreKtor_ioMemoryCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_ioMemoryCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_ioMemory *Empty __attribute__((swift_name("Empty")));
@end

__attribute__((swift_name("KotlinMapEntry")))
@protocol MsdkCoreKotlinMapEntry
@required
@property (readonly) id _Nullable key __attribute__((swift_name("key")));
@property (readonly) id _Nullable value_ __attribute__((swift_name("value_")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpStatusCode.Companion")))
@interface MsdkCoreKtor_httpHttpStatusCodeCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpHttpStatusCodeCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_httpHttpStatusCode *)fromValueValue:(int32_t)value __attribute__((swift_name("fromValue(value:)")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Accepted __attribute__((swift_name("Accepted")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *BadGateway __attribute__((swift_name("BadGateway")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *BadRequest __attribute__((swift_name("BadRequest")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Conflict __attribute__((swift_name("Conflict")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Continue __attribute__((swift_name("Continue")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Created __attribute__((swift_name("Created")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *ExpectationFailed __attribute__((swift_name("ExpectationFailed")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *FailedDependency __attribute__((swift_name("FailedDependency")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Forbidden __attribute__((swift_name("Forbidden")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Found __attribute__((swift_name("Found")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *GatewayTimeout __attribute__((swift_name("GatewayTimeout")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Gone __attribute__((swift_name("Gone")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *InsufficientStorage __attribute__((swift_name("InsufficientStorage")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *InternalServerError __attribute__((swift_name("InternalServerError")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *LengthRequired __attribute__((swift_name("LengthRequired")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Locked __attribute__((swift_name("Locked")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *MethodNotAllowed __attribute__((swift_name("MethodNotAllowed")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *MovedPermanently __attribute__((swift_name("MovedPermanently")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *MultiStatus __attribute__((swift_name("MultiStatus")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *MultipleChoices __attribute__((swift_name("MultipleChoices")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NoContent __attribute__((swift_name("NoContent")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NonAuthoritativeInformation __attribute__((swift_name("NonAuthoritativeInformation")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NotAcceptable __attribute__((swift_name("NotAcceptable")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NotFound __attribute__((swift_name("NotFound")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NotImplemented __attribute__((swift_name("NotImplemented")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *NotModified __attribute__((swift_name("NotModified")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *OK __attribute__((swift_name("OK")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *PartialContent __attribute__((swift_name("PartialContent")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *PayloadTooLarge __attribute__((swift_name("PayloadTooLarge")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *PaymentRequired __attribute__((swift_name("PaymentRequired")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *PermanentRedirect __attribute__((swift_name("PermanentRedirect")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *PreconditionFailed __attribute__((swift_name("PreconditionFailed")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Processing __attribute__((swift_name("Processing")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *ProxyAuthenticationRequired __attribute__((swift_name("ProxyAuthenticationRequired")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *RequestHeaderFieldTooLarge __attribute__((swift_name("RequestHeaderFieldTooLarge")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *RequestTimeout __attribute__((swift_name("RequestTimeout")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *RequestURITooLong __attribute__((swift_name("RequestURITooLong")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *RequestedRangeNotSatisfiable __attribute__((swift_name("RequestedRangeNotSatisfiable")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *ResetContent __attribute__((swift_name("ResetContent")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *SeeOther __attribute__((swift_name("SeeOther")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *ServiceUnavailable __attribute__((swift_name("ServiceUnavailable")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *SwitchProxy __attribute__((swift_name("SwitchProxy")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *SwitchingProtocols __attribute__((swift_name("SwitchingProtocols")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *TemporaryRedirect __attribute__((swift_name("TemporaryRedirect")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *TooEarly __attribute__((swift_name("TooEarly")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *TooManyRequests __attribute__((swift_name("TooManyRequests")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *Unauthorized __attribute__((swift_name("Unauthorized")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *UnprocessableEntity __attribute__((swift_name("UnprocessableEntity")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *UnsupportedMediaType __attribute__((swift_name("UnsupportedMediaType")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *UpgradeRequired __attribute__((swift_name("UpgradeRequired")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *UseProxy __attribute__((swift_name("UseProxy")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *VariantAlsoNegotiates __attribute__((swift_name("VariantAlsoNegotiates")));
@property (readonly) MsdkCoreKtor_httpHttpStatusCode *VersionNotSupported __attribute__((swift_name("VersionNotSupported")));
@property (readonly) NSArray<MsdkCoreKtor_httpHttpStatusCode *> *allStatusCodes __attribute__((swift_name("allStatusCodes")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpUrl.Companion")))
@interface MsdkCoreKtor_httpUrlCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpUrlCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((swift_name("Ktor_httpParameters")))
@protocol MsdkCoreKtor_httpParameters <MsdkCoreKtor_utilsStringValues>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpURLProtocol")))
@interface MsdkCoreKtor_httpURLProtocol : MsdkCoreBase
- (instancetype)initWithName:(NSString *)name defaultPort:(int32_t)defaultPort __attribute__((swift_name("init(name:defaultPort:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) MsdkCoreKtor_httpURLProtocolCompanion *companion __attribute__((swift_name("companion")));
- (MsdkCoreKtor_httpURLProtocol *)doCopyName:(NSString *)name defaultPort:(int32_t)defaultPort __attribute__((swift_name("doCopy(name:defaultPort:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) int32_t defaultPort __attribute__((swift_name("defaultPort")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpMethod.Companion")))
@interface MsdkCoreKtor_httpHttpMethodCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpHttpMethodCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_httpHttpMethod *)parseMethod:(NSString *)method __attribute__((swift_name("parse(method:)")));
@property (readonly) NSArray<MsdkCoreKtor_httpHttpMethod *> *DefaultMethods __attribute__((swift_name("DefaultMethods")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Delete __attribute__((swift_name("Delete")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Get __attribute__((swift_name("Get")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Head __attribute__((swift_name("Head")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Options __attribute__((swift_name("Options")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Patch __attribute__((swift_name("Patch")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Post __attribute__((swift_name("Post")));
@property (readonly) MsdkCoreKtor_httpHttpMethod *Put __attribute__((swift_name("Put")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreChildHandle")))
@protocol MsdkCoreKotlinx_coroutines_coreChildHandle <MsdkCoreKotlinx_coroutines_coreDisposableHandle>
@required
- (BOOL)childCancelledCause:(MsdkCoreKotlinThrowable *)cause __attribute__((swift_name("childCancelled(cause:)")));
@property (readonly) id<MsdkCoreKotlinx_coroutines_coreJob> _Nullable parent __attribute__((swift_name("parent")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreChildJob")))
@protocol MsdkCoreKotlinx_coroutines_coreChildJob <MsdkCoreKotlinx_coroutines_coreJob>
@required
- (void)parentCancelledParentJob:(id<MsdkCoreKotlinx_coroutines_coreParentJob>)parentJob __attribute__((swift_name("parentCancelled(parentJob:)")));
@end

__attribute__((swift_name("KotlinSequence")))
@protocol MsdkCoreKotlinSequence
@required
- (id<MsdkCoreKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreSelectClause")))
@protocol MsdkCoreKotlinx_coroutines_coreSelectClause
@required
@property (readonly) id clauseObject __attribute__((swift_name("clauseObject")));
@property (readonly) MsdkCoreKotlinUnit *(^(^ _Nullable onCancellationConstructor)(id<MsdkCoreKotlinx_coroutines_coreSelectInstance>, id _Nullable, id _Nullable))(MsdkCoreKotlinThrowable *) __attribute__((swift_name("onCancellationConstructor")));
@property (readonly) id _Nullable (^processResFunc)(id, id _Nullable, id _Nullable) __attribute__((swift_name("processResFunc")));
@property (readonly) void (^regFunc)(id, id<MsdkCoreKotlinx_coroutines_coreSelectInstance>, id _Nullable) __attribute__((swift_name("regFunc")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreSelectClause0")))
@protocol MsdkCoreKotlinx_coroutines_coreSelectClause0 <MsdkCoreKotlinx_coroutines_coreSelectClause>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsGMTDate.Companion")))
@interface MsdkCoreKtor_utilsGMTDateCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_utilsGMTDateCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_utilsGMTDate *START __attribute__((swift_name("START")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsWeekDay")))
@interface MsdkCoreKtor_utilsWeekDay : MsdkCoreKotlinEnum<MsdkCoreKtor_utilsWeekDay *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_utilsWeekDayCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *monday __attribute__((swift_name("monday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *tuesday __attribute__((swift_name("tuesday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *wednesday __attribute__((swift_name("wednesday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *thursday __attribute__((swift_name("thursday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *friday __attribute__((swift_name("friday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *saturday __attribute__((swift_name("saturday")));
@property (class, readonly) MsdkCoreKtor_utilsWeekDay *sunday __attribute__((swift_name("sunday")));
+ (MsdkCoreKotlinArray<MsdkCoreKtor_utilsWeekDay *> *)values __attribute__((swift_name("values()")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsMonth")))
@interface MsdkCoreKtor_utilsMonth : MsdkCoreKotlinEnum<MsdkCoreKtor_utilsMonth *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_utilsMonthCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *january __attribute__((swift_name("january")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *february __attribute__((swift_name("february")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *march __attribute__((swift_name("march")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *april __attribute__((swift_name("april")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *may __attribute__((swift_name("may")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *june __attribute__((swift_name("june")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *july __attribute__((swift_name("july")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *august __attribute__((swift_name("august")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *september __attribute__((swift_name("september")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *october __attribute__((swift_name("october")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *november __attribute__((swift_name("november")));
@property (class, readonly) MsdkCoreKtor_utilsMonth *december __attribute__((swift_name("december")));
+ (MsdkCoreKotlinArray<MsdkCoreKtor_utilsMonth *> *)values __attribute__((swift_name("values()")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpHttpProtocolVersion.Companion")))
@interface MsdkCoreKtor_httpHttpProtocolVersionCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpHttpProtocolVersionCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_httpHttpProtocolVersion *)fromValueName:(NSString *)name major:(int32_t)major minor:(int32_t)minor __attribute__((swift_name("fromValue(name:major:minor:)")));
- (MsdkCoreKtor_httpHttpProtocolVersion *)parseValue:(id)value __attribute__((swift_name("parse(value:)")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *HTTP_1_0 __attribute__((swift_name("HTTP_1_0")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *HTTP_1_1 __attribute__((swift_name("HTTP_1_1")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *HTTP_2_0 __attribute__((swift_name("HTTP_2_0")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *QUIC __attribute__((swift_name("QUIC")));
@property (readonly) MsdkCoreKtor_httpHttpProtocolVersion *SPDY_3 __attribute__((swift_name("SPDY_3")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioByteReadPacket")))
@interface MsdkCoreKtor_ioByteReadPacket : MsdkCoreKtor_ioInput
- (instancetype)initWithHead:(MsdkCoreKtor_ioChunkBuffer *)head pool:(id<MsdkCoreKtor_ioObjectPool>)pool __attribute__((swift_name("init(head:pool:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithHead:(MsdkCoreKtor_ioChunkBuffer *)head remaining:(int64_t)remaining pool:(id<MsdkCoreKtor_ioObjectPool>)pool __attribute__((swift_name("init(head:remaining:pool:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) MsdkCoreKtor_ioByteReadPacketCompanion *companion __attribute__((swift_name("companion")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (void)closeSource __attribute__((swift_name("closeSource()")));
- (MsdkCoreKtor_ioByteReadPacket *)doCopy __attribute__((swift_name("doCopy()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (MsdkCoreKtor_ioChunkBuffer * _Nullable)fill __attribute__((swift_name("fill()")));

/**
 * @note This method has protected visibility in Kotlin source and is intended only for use by subclasses.
*/
- (int32_t)fillDestination:(MsdkCoreKtor_ioMemory *)destination offset:(int32_t)offset length:(int32_t)length __attribute__((swift_name("fill(destination:offset:length:)")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("Ktor_ioReadSession")))
@protocol MsdkCoreKtor_ioReadSession
@required
- (int32_t)discardN:(int32_t)n __attribute__((swift_name("discard(n:)")));
- (MsdkCoreKtor_ioChunkBuffer * _Nullable)requestAtLeast:(int32_t)atLeast __attribute__((swift_name("request(atLeast:)")));
@property (readonly) int32_t availableForRead __attribute__((swift_name("availableForRead")));
@end

__attribute__((swift_name("KotlinSuspendFunction1")))
@protocol MsdkCoreKotlinSuspendFunction1 <MsdkCoreKotlinFunction>
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)invokeP1:(id _Nullable)p1 completionHandler:(void (^)(id _Nullable_result, NSError * _Nullable))completionHandler __attribute__((swift_name("invoke(p1:completionHandler:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpURLBuilder.Companion")))
@interface MsdkCoreKtor_httpURLBuilderCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpURLBuilderCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((swift_name("Ktor_httpParametersBuilder")))
@protocol MsdkCoreKtor_httpParametersBuilder <MsdkCoreKtor_utilsStringValuesBuilder>
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinKVariance")))
@interface MsdkCoreKotlinKVariance : MsdkCoreKotlinEnum<MsdkCoreKotlinKVariance *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) MsdkCoreKotlinKVariance *invariant __attribute__((swift_name("invariant")));
@property (class, readonly) MsdkCoreKotlinKVariance *in __attribute__((swift_name("in")));
@property (class, readonly) MsdkCoreKotlinKVariance *out __attribute__((swift_name("out")));
+ (MsdkCoreKotlinArray<MsdkCoreKotlinKVariance *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<MsdkCoreKotlinKVariance *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinKTypeProjection.Companion")))
@interface MsdkCoreKotlinKTypeProjectionCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKotlinKTypeProjectionCompanion *shared __attribute__((swift_name("shared")));

/**
 * @note annotations
 *   kotlin.jvm.JvmStatic
*/
- (MsdkCoreKotlinKTypeProjection *)contravariantType:(id<MsdkCoreKotlinKType>)type __attribute__((swift_name("contravariant(type:)")));

/**
 * @note annotations
 *   kotlin.jvm.JvmStatic
*/
- (MsdkCoreKotlinKTypeProjection *)covariantType:(id<MsdkCoreKotlinKType>)type __attribute__((swift_name("covariant(type:)")));

/**
 * @note annotations
 *   kotlin.jvm.JvmStatic
*/
- (MsdkCoreKotlinKTypeProjection *)invariantType:(id<MsdkCoreKotlinKType>)type __attribute__((swift_name("invariant(type:)")));
@property (readonly) MsdkCoreKotlinKTypeProjection *STAR __attribute__((swift_name("STAR")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_httpURLProtocol.Companion")))
@interface MsdkCoreKtor_httpURLProtocolCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_httpURLProtocolCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_httpURLProtocol *)createOrDefaultName:(NSString *)name __attribute__((swift_name("createOrDefault(name:)")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *HTTP __attribute__((swift_name("HTTP")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *HTTPS __attribute__((swift_name("HTTPS")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *SOCKS __attribute__((swift_name("SOCKS")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *WS __attribute__((swift_name("WS")));
@property (readonly) MsdkCoreKtor_httpURLProtocol *WSS __attribute__((swift_name("WSS")));
@property (readonly) NSDictionary<NSString *, MsdkCoreKtor_httpURLProtocol *> *byName __attribute__((swift_name("byName")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreParentJob")))
@protocol MsdkCoreKotlinx_coroutines_coreParentJob <MsdkCoreKotlinx_coroutines_coreJob>
@required
- (MsdkCoreKotlinCancellationException *)getChildJobCancellationCause __attribute__((swift_name("getChildJobCancellationCause()")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreSelectInstance")))
@protocol MsdkCoreKotlinx_coroutines_coreSelectInstance
@required
- (void)disposeOnCompletionDisposableHandle:(id<MsdkCoreKotlinx_coroutines_coreDisposableHandle>)disposableHandle __attribute__((swift_name("disposeOnCompletion(disposableHandle:)")));
- (void)selectInRegistrationPhaseInternalResult:(id _Nullable)internalResult __attribute__((swift_name("selectInRegistrationPhase(internalResult:)")));
- (BOOL)trySelectClauseObject:(id)clauseObject result:(id _Nullable)result __attribute__((swift_name("trySelect(clauseObject:result:)")));
@property (readonly) id<MsdkCoreKotlinCoroutineContext> context __attribute__((swift_name("context")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsWeekDay.Companion")))
@interface MsdkCoreKtor_utilsWeekDayCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_utilsWeekDayCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_utilsWeekDay *)fromOrdinal:(int32_t)ordinal __attribute__((swift_name("from(ordinal:)")));
- (MsdkCoreKtor_utilsWeekDay *)fromValue:(NSString *)value __attribute__((swift_name("from(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_utilsMonth.Companion")))
@interface MsdkCoreKtor_utilsMonthCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_utilsMonthCompanion *shared __attribute__((swift_name("shared")));
- (MsdkCoreKtor_utilsMonth *)fromOrdinal:(int32_t)ordinal __attribute__((swift_name("from(ordinal:)")));
- (MsdkCoreKtor_utilsMonth *)fromValue:(NSString *)value __attribute__((swift_name("from(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Ktor_ioByteReadPacket.Companion")))
@interface MsdkCoreKtor_ioByteReadPacketCompanion : MsdkCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) MsdkCoreKtor_ioByteReadPacketCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) MsdkCoreKtor_ioByteReadPacket *Empty __attribute__((swift_name("Empty")));
@end

#pragma pop_macro("_Nullable_result")
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
