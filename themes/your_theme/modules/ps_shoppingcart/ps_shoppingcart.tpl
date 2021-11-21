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

<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header dropdown">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}">
      {/if}
		<i class="fas fa-shopping-cart shopping-cart fa-lg"></i>
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger cart-products-count">{$cart.products_count}</span>
      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>
    <div class="body dropdown-menu dropdown-menu-lg-end">
      <ul>
        {foreach from=$cart.products item=product}
          <li>
		    {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
		  </li>
        {/foreach}
      </ul>
      <div class="cart-subtotals text-dark fw-bold fs-6 my-2">
        {foreach from=$cart.subtotals item="subtotal"}
          <span class="{$subtotal.type}">
            <span class="label">{$subtotal.label}</span>
            <span class="value">{$subtotal.amount}</span>
          </span>
        {/foreach}
	  <span class="text-bold">{$currency.sign}</span>
      </div>
	  
	  <div class="col-12 pt-2 text-center">
      <a rel="nofollow" href="{$cart_url}" class="btn btn-cart btn-light">
        {l s='Proceed to checkout' d='Shop.Theme.Actions'}
      </a>
    </div>
	
    </div>
  </div>
</div>