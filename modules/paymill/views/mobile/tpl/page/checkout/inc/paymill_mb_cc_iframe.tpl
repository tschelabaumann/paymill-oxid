[{assign var="oxConfig" value=$oView->getConfig()}]
<div id="paymentOption_[{$sPaymentID}]" class="payment-option [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]active-payment[{/if}]">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>

    <ul class="form">
        <p class="payment-errors cc pm-mobile" style="display:none;"></p>
        <div>
            <ul id="paymill_brands" class="pm-mobile">
                [{foreach key=brandsId from=$paymillBrands item=cardBrand name=paymillBrandSelect}]
                    <li class="paymill-card-number-[{$cardBrand}]"></li>
                [{/foreach}]
            </ul>
        </div>
        <li>
            [{if $fastCheckoutCc == 'true'}]
                <table id="paymillFastCheckoutTable">
                    <tr>
                        <td>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_NUMBER" }]: </td>
                        <td id="paymillFcCardNumber" class="paymill-card-number-[{$brand}]">[{$paymillCcLastFour}]</td>
                    </tr>
                    <tr>
                        <td>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_SECURITYCODE" }]: </td>
                        <td>[{$paymillCcCvc}]</td>
                    </tr>
                    <tr>
                        <td>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_HOLDERNAME" }]: </td>
                        <td>[{$paymillCcCardHolder}]</td>
                    </tr>
                    <tr>
                        <td>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_VALIDUNTIL" }]: </td>
                        <td>[{$paymillCcExpireMonth}]/[{$paymillCcExpireYear}]</td>
                    </tr>
                    <tr>
                    <td></td>
                    <td>
                    <button id="paymillFastCheckoutIframeChange" type="button">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_IFRAME_CHANGE }]</button>
                    </td>
                    </tr>
                </table>
            [{/if}]
            <div id="payment-form-cc">
            </div>
        </li>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <li>
                    <div class="payment-desc">
                        [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                    </div>
                </li>
            [{/if}]
        [{/block}]
    </ul>
</div>