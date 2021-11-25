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
{block name='product_miniature_item'}
<div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="product col my-2">
  {if isset($position)}<meta itemprop="position" content="{$position}" />{/if}
  <article class="card box-product product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemprop="item" itemscope itemtype="http://schema.org/Product">
    <div class="card-body">
	   <div class="thumbnail-container">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"
			        class="thumbnail product-thumbnail img-fluid"
            />
          </a>
        {else}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" class="thumbnail product-thumbnail img-fluid" />
          </a>
        {/if}
      {/block}
      </div>

      <div class="product-description px-2">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}" itemprop="url" content="{$product.url}">{$product.name|truncate:70:'...'}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}" itemprop="url" content="{$product.url}">{$product.name|truncate:70:'...'}</a></h2>
          {/if}
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
               {if $product.discount_type === 'percentage'}
                <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
               {elseif $product.discount_type === 'amount'}
                <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
               {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

                <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">{$product.price}</span>
                 <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="invisible">
                  <meta itemprop="priceCurrency" content="{$currency.iso_code}" />
                  <meta itemprop="price" content="{$product.price_amount}" />
                </div>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
		
		
		
	  	  {block name='product-manufacturer'}
		     {if $product.id_manufacturer}
		      <div class="product-manufacturer">
		       <a href="{$base_dir}index.php?id_manufacturer={$product.id_manufacturer}&controller=manufacturer&id_lang={Tools::getValue('id_lang')}">
		        <span class="brand">{Manufacturer::getNameById($product.id_manufacturer)}</span>
		       </a>
		      </div>
		     {/if}
        {/block}
		
		  </div>
    </div>
   
      {include file='catalog/_partials/product-flags.tpl'}
	
    <div class="card-footer clearfix position-relative">
     
      {block name='product_variants'}
          {if $product.main_variants}
            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
      {/block}

	   {block name='product-details'}
	    <div class="float-start">
	     {include file='catalog/_partials/product-details_catalog.tpl'}
	    </div>
	   {/block}

     {block name='add-to-cart'}
      <div class="float-end">	  
       <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh">
        <input type="hidden" name="token" value="{$static_token}">
        <input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
        <input type="hidden" name="qty" value="1">
        <button class="btn btn-dark btn-sm add-to-cart" data-button-action="add-to-cart" type="submit" {if $product.quantity < 1 }disabled{/if}>
		     {if $product.availability == 'available'}
            <i class="material-icons shopping-cart">&#xE547;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
          {elseif $product.availability == 'last_remaining_items'}
            <i class="material-icons shopping-cart">&#xE547;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
          {else}
            {$product.availability_message}
          {/if}
        </button>
       </form>
      </div>
     {/block}

    </div>
	
  </article>
</div>
{/block}
