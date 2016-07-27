module StaticPagesHelper

  def heading_detail(heading)
    base_heading = "Welcome to Toy"

    if heading != ''
      base_heading = base_heading + ' | ' + heading
    else
      base_heading
    end
  end

end
