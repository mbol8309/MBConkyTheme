require 'cairo'

function draw_boxes(x, y, width, height, radius)
    if conky_window == nil then return end

    local cs = cairo_xlib_surface_create(
        conky_window.display, conky_window.drawable,
        conky_window.visual, conky_window.width, conky_window.height)

    local cr = cairo_create(cs)

    -- Parámetros del recuadro
    local line_width = 2
    local r, g, b, a = 0, 0, 0, 0.8 -- color blanco con 80% opacidad

    -- Dibujar el recuadro con esquinas redondeadas
    
    cairo_set_line_width(cr, line_width)

    cairo_move_to(cr, x + radius, y)
    cairo_line_to(cr, x + width - radius, y)
    cairo_arc(cr, x + width - radius, y + radius, radius, -math.pi / 2, 0)
    cairo_line_to(cr, x + width, y + height - radius)
    cairo_arc(cr, x + width - radius, y + height - radius, radius, 0, math.pi / 2)
    cairo_line_to(cr, x + radius, y + height)
    cairo_arc(cr, x + radius, y + height - radius, radius, math.pi / 2, math.pi)
    cairo_line_to(cr, x, y + radius)
    cairo_arc(cr, x + radius, y + radius, radius, math.pi, 1.5 * math.pi)
    cairo_close_path(cr)

    cairo_set_source_rgba(cr, 0.05, 0.30, 0.5, 0.5)
    cairo_fill_preserve(cr)

    cairo_set_source_rgba(cr, 0.85, 0.90, 0.85, 1)
    
    -- cairo_stroke(cr)

    cairo_destroy(cr)
end

function conky_main()
    if conky_window ~= nil then 
        draw_boxes(0, 0, conky_window.width, 70, 10)
        
        draw_boxes(0, 85, conky_window.width, 140, 10)
        
        draw_boxes(0, 245, conky_window.width, 55, 10)
        
        draw_boxes(0, 315, conky_window.width, 65, 10)
        
        draw_boxes(0, 395, conky_window.width, 180, 10)
        draw_boxes(0, 600, conky_window.width, 70, 10)
        draw_boxes(0, 685, conky_window.width, 90, 10)
        draw_boxes(0, 790, conky_window.width, 90, 10)
        draw_boxes(0,895,conky_window.width, 90, 10)
    end
-- quand fond nécessaire
--    conky_draw_bg()
end
