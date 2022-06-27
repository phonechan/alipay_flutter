package com.cardinfolink.alipay

import android.app.Activity
import com.alipay.sdk.app.PayTask
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*
import kotlin.coroutines.CoroutineContext

class AlipayPluginDelegate : CoroutineScope {
    private val job = Job()
    override val coroutineContext: CoroutineContext = Dispatchers.Main + job

    private lateinit var activity: Activity

    fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    fun onDetachedFromActivity() {
        job.cancel()
    }

    fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "alipay" -> startPay(call, result)
        }
    }

    private fun startPay(call: MethodCall, result: MethodChannel.Result) {
        val orderInfo = call.argument("paymentString") ?: ""
        launch {
            val payResult = payTask(orderInfo)
            withContext(Dispatchers.Main) {
                result.success(payResult)
            }
        }
    }

    private suspend fun payTask(orderInfo: String) = withContext(Dispatchers.IO) {
        val alipay = PayTask(activity)
        alipay.payV2(orderInfo, true)
    }

}