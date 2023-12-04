<div class="container">
    <% if $Title && $ShowTitle %>
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="element-title">$Title</h2>
            </div>
        </div>
    <% end_if %>
    <div class="glide">
        <div class="glide__track" data-glide-el="track">
            <ul class="glide__slides">
                <% loop $Testimonials %>
                    <li class="glide__slide">
                        <div class="testimonial">
                            <blockquote class="d-flex justify-content-center flex-column align-items-center">
                                <div class="my-3">
                                    $Quote
                                </div>
                                <footer class="d-flex align-items-center">
                                    <% if $Image %>
                                        <% with $Image.Fill(300,300) %>
                                            <picture>
                                                <source type="image/webp" srcset="$Format('webp').URL">
                                                <img src="$URL" class="img-fluid testimonial-image me-3"
                                                     alt="$Up.$Up.AttributionName" loading="lazy" width="$Width"
                                                     height="$Height">
                                            </picture>
                                        <% end_with %>
                                    <% end_if %>
                                    <cite>
                                        <span class="attribution-name">$AttributionName</span>
                                        <span class="attribution-title">$AttributionTitle</span>
                                    </cite>
                                </footer>
                            </blockquote>
                        </div>
                    </li>
                <% end_loop %>
            </ul>
        </div>
        <div class="glide__arrows" data-glide-el="controls">
            <button class="glide__arrow glide__arrow--left" data-glide-dir="<" aria-label="<%t Testimonials.Previous 'Previous Slide' %>">
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512" aria-labelledby="prev-title">
                    <title id="prev-title"><%t Testimonials.LeftArrow 'Arrow pointing left' %></title>
                    <style>svg {
                        fill: #000000
                    }</style>
                    <path
                        d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/>
                </svg>
            </button>
            <button class="glide__arrow glide__arrow--right" data-glide-dir=">" aria-label="<%t Testimonials.Next 'Next Slide' %>">
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512" aria-labelledby="next-title">
                    <title id="next-title"><%t Testimonials.RightArrow 'Arrow pointing right' %></title>
                    <style>svg {
                        fill: #000000
                    }</style>
                    <path
                        d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                </svg>
            </button>
        </div>
        <div class="glide__bullets" data-glide-el="controls[nav]">
            <% loop $Testimonials %>
                <button class="glide__bullet" data-glide-dir="={$Pos(0)}" aria-label="<%t Testimonials.JumpTo 'Jump to slide' %> $Pos"></button>
            <% end_loop %>
        </div>
    </div>
</div>
