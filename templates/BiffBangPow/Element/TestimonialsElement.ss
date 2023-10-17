<div class="glide">
    <div class="glide__track" data-glide-el="track">
        <ul class="glide__slides">
            <% loop $Testimonials %>
                <li class="glide__slide">
                    <div class="testimonial">
                        <% if $Image %>
                            <% with $Image.Fill(300,300) %>
                                <picture>
                                    <source type="image/webp" srcset="$Format('webp').URL">
                                    <img src="" data-src="$URL" class="lazyload img-fluid" alt="$Up.$Up.Attribution"
                                         loading="lazy" width="$Width" height="$Height">
                                </picture>
                            <% end_with %>
                        <% end_if %>
                        <blockquote>
                            $Quote
                            <footer>
                                <cite>$Attribution</cite>
                            </footer>
                        </blockquote>
                    </div>
                </li>
            <% end_loop %>
        </ul>
    </div>
    <div class="glide__arrows" data-glide-el="controls">
        <button class="glide__arrow glide__arrow--left" data-glide-dir="<">prev</button>
        <button class="glide__arrow glide__arrow--right" data-glide-dir=">">next</button>
    </div>
    <div class="glide__bullets" data-glide-el="controls[nav]">
        <% loop $Testimonials %>
            <button class="glide__bullet" data-glide-dir="={$Pos}"></button>
        <% end_loop %>
    </div>
</div>

<% require javascript('biffbangpow/silverstripe-testimonial-element:client/dist/javascript/testimonials.js') %>
<% require css('biffbangpow/silverstripe-testimonial-element:client/dist/css/testimonials.css') %>
