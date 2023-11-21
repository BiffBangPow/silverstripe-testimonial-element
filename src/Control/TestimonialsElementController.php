<?php

namespace BiffBangPow\Element\Control;

use BiffBangPow\Element\StatsElement;
use BiffBangPow\Element\TestimonialsElement;
use DNADesign\Elemental\Controllers\ElementController;
use SilverStripe\View\Requirements;
use SilverStripe\View\ThemeResourceLoader;

class TestimonialsElementController extends ElementController
{
    protected function init()
    {
        parent::init();
        $themeCSS = ThemeResourceLoader::inst()->findThemedCSS('client/dist/css/elements/testimonials');
        if ($themeCSS) {
            Requirements::css($themeCSS, '', ['defer' => true]);
        }

        if (TestimonialsElement::config()->get('include_default_js') === true) {
            Requirements::javascript('biffbangpow/silverstripe-testimonial-element:client/dist/javascript/testimonials.js', [
                'defer' => true,
                'async' => true
            ]);
        }

        if (TestimonialsElement::config()->get('include_default_css') === true) {
            Requirements::css('biffbangpow/silverstripe-testimonial-element:client/dist/css/testimonials.css', '', [
                'defer' => true
            ]);
        }

    }
}
