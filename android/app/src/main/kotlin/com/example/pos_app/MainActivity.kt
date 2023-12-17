package net.soberdev.pos.client

import android.accounts.Account
import android.accounts.AccountManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "net.soberdev.pos.client/email"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getAccountEmail") {
                val accountEmail = getAccountEmail(AccountManager.get(this))
                result.success(accountEmail);
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAccountEmail(accountManager: AccountManager): String? {
        val accounts = accountManager.getAccountsByType("com.google")
        val accountEmail: String? = if (accounts.isNotEmpty()) {
            accounts[0].name
        } else {
            null
        }
        return accountEmail
    }
}