{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

<div class="d-flex position-relative">
	<a href="{$product.url}" data-id_customization="{$product.id_customization|intval}" title="{$product.name}">
      {if $product.cover}
        <img class="flex-shrink-0 me-2 small-img-cart" src="{$product.cover.bySize.small_default.url}" alt="{$product.name|escape:'quotes'}">
      {else}
        <img class="flex-shrink-0 me-2 small-img-cart" src="{$urls.no_picture_image.bySize.small_default.url}" />
      {/if}
	</a>
  
 <div>
   <span class="product-name">{$product.name}</span>
  <div>
   <span class="product-quantity">{$product.quantity} x </span>
   <span class="product-price">{$product.price}</span>
    <a class="remove-from-cart"
       rel="nofollow"
       href="{$product.remove_from_cart_url}"
       data-link-action="remove-from-cart"
       title="{l s='remove from cart' d='Shop.Theme.Actions'}"
    >
    {l s='Remove' d='Shop.Theme.Actions'} <i class="fas fa-trash text-dark float-end"></i>
    </a>
  </div>
 </div>
</div>

{if $product.customizations|count}
    <div class="customizations">
        <ul>
            {foreach from=$product.customizations item='customization'}
                <li>
                    <span class="product-quantity">{$customization.quantity}</span>
                    <a href="{$customization.remove_from_cart_url}" title="{l s='remove from cart' d='Shop.Theme.Actions'}" class="remove-from-cart" rel="nofollow">{l s='Remove' d='Shop.Theme.Actions'}</a>
                    <ul>
                        {foreach from=$customization.fields item='field'}
                            <li>
                                <span>{$field.label}</span>
                                {if $field.type == 'text'}
                                    <span>{$field.text nofilter}</span>
                                {elseif $field.type == 'image'}
                                    <img src="{$field.image.small.url}">
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}
