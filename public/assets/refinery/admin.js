function ImageDialog(t){self=this,this.defaults={callback:null,multiple:!1},this.settings=$.extend({},this.defaults,t),this.create=function(){this.callback=this.settings.callback,this.init_tabs(),this.init_select(),this.init_actions()},this.init_tabs=function(){var t=$("#dialog_menu_left input:radio"),e=t.parent().filter(".selected_radio").find("input:radio").first()||t.first();t.click(function(){self.switch_area($(this))}),e.attr("checked","true"),self.switch_area(e)},this.switch_area=function(t){$("#dialog_menu_left .selected_radio").removeClass("selected_radio"),t.parent().addClass("selected_radio"),$("#dialog_main .dialog_area").hide(),$("#"+t.val()+"_area").show()},this.init_select=function(){$("#existing_image_area_content ul li img").click(function(){self.toggle_image($(this))}),(selected_img=$("#existing_image_area_content ul li.selected img")).length>0&&self.toggle_image(selected_img.first())},this.toggle_image=function(t){if(t.length>0){self.settings.multiple||$("#existing_image_area_content ul li.selected").removeClass("selected"),t.parent().toggleClass("selected"),t.attr("data-id");var e=$("#existing_image_size_area li.selected a").attr("data-geometry"),i=$("#existing_image_size_area li.selected a").attr("data-size"),n=$("#wants_to_resize_image").is(":checked");image_url=n?t.attr("data-"+i):t.attr("data-original"),parent&&(null!=(wym_src=parent.document.getElementById("wym_src"))&&(wym_src.value=image_url),null!=(wym_title=parent.document.getElementById("wym_title"))&&(wym_title.value=t.attr("title")),null!=(wym_alt=parent.document.getElementById("wym_alt"))&&(wym_alt.value=t.attr("alt")),null!=(wym_size=parent.document.getElementById("wym_size"))&&"undefined"!=typeof e&&(wym_size.value=e.replace(/[<>=]/g,"")))}},this.submit_image_choice=function(t){t.preventDefault(),selected_images=$("#existing_image_area_content ul li.selected img"),selected_images=self.settings.multiple?selected_images.get():selected_images.get(0),selected_images&&$.isFunction(self.callback)&&self.callback(selected_images),close_dialog(t)},this.init_actions=function(){$("#existing_image_area .form-actions-dialog #submit_button").not(".wym_iframe_body #existing_image_area .form-actions-dialog #submit_button").click($.proxy(self.submit_image_choice,self)),$(".form-actions-dialog #cancel_button").not(".wym_iframe_body .form-actions-dialog #cancel_button").click($.proxy(close_dialog,self)),$("#existing_image_size_area ul li a").click(function(t){$("#existing_image_size_area ul li").removeClass("selected"),$(this).parent().addClass("selected"),$("#existing_image_size_area #wants_to_resize_image").attr("checked","checked"),self.toggle_image($("#existing_image_area_content ul li.selected img")),t.preventDefault()}),$("#existing_image_size_area #wants_to_resize_image").change(function(){$(this).is(":checked")?$("#existing_image_size_area ul li:first a").click():($("#existing_image_size_area ul li").removeClass("selected"),self.toggle_image($("#existing_image_area_content ul li.selected img")))}),image_area=$("#existing_image_area").not("#wym_iframe_body #existing_image_area"),image_area.find(".form-actions input#submit_button").click($.proxy(function(t){t.preventDefault(),$(this.document.getElementById("wym_dialog_submit")).click()},parent)),image_area.find(".form-actions a.close_dialog").click(close_dialog)}}var shiftHeld=!1,initialLoad=!0;init_refinery_admin=function(){init_interface(),init_sortable_menu(),init_submit_continue(),init_modal_dialogs(),init_tooltips(),init_ajaxy_pagination()},$(document).ready(init_refinery_admin),"object"==typeof window.onpopstate&&$(window).bind("popstate",function(){initialLoad||$(document).paginateTo(location.pathname+location.href.split(location.pathname)[1]),initialLoad=!1}),$.fn.paginateTo=function(t){$.ajax({url:t,cache:!1,success:function(t){$(".pagination_container").slideTo(t),$(".pagination_container .pagination a").each(function(){$(this).attr("href",$(this).attr("href").replace(/\?\_\=[^&]+&/,"?"))})},error:function(){window.location=popstate_location}})},$.fn.slideTo=function(t){return $(this).html(t),$(this).applyMinimumHeightFromChildren(),$(this).find(".pagination_frame").removeClass("frame_right").addClass("frame_center"),init_modal_dialogs(),init_tooltips(),$(this)},$.fn.applyMinimumHeightFromChildren=function(){return child_heights=0,$(this).children().each(function(t,e){child_heights+=$(e).height(),$.each(["marginTop","marginBottom","paddingTop","paddingBottom"],function(t,i){child_heights+=parseInt($(e).css(i))||0})}),$(this).css("min-height",child_heights),$(this)},init_modal_dialogs=function(){$('a[href*="dialog=true"]').not("#dialog_container a").each(function(t,e){$(e).data({"dialog-width":parseInt($($(e).attr("href").match("width=([0-9]*)")).last().get(0),10)||928,"dialog-height":parseInt($($(e).attr("href").match("height=([0-9]*)")).last().get(0),10)||473,"dialog-title":$(e).attr("title")||$(e).attr("name")||$(e).html()||null}).attr("href",$(e).attr("href").replace(/(&(amp;)?|\?)(dialog=true|(width|height)=\d+)/g,"").replace(/(\/[^&\?]*)&(amp;)?/,"$1?")).click(function(t){$anchor=$(this),iframe_src=(iframe_src=$anchor.attr("href"))+(iframe_src.indexOf("?")>-1?"&":"?")+"app_dialog=true&dialog=true",iframe=$("<iframe id='dialog_iframe' frameborder='0' marginheight='0' marginwidth='0' border='0'></iframe>"),iframe.dialog({title:$anchor.data("dialog-title"),modal:!0,resizable:!1,autoOpen:!0,width:$anchor.data("dialog-width"),height:$anchor.data("dialog-height"),open:onOpenDialog,close:onCloseDialog}),iframe.attr("src",iframe_src),t.preventDefault()})})},refinery_dialog_success=function(){close_dialog(),$.ajax({url:window.location.pathname+window.location.search,cache:!1,success:function(t){$(".pagination_container").html(t),$("#flash_container > #flash").remove(),$("#flash_container").append($(".pagination_container").find("#flash")),$("#flash").css({width:"auto",visibility:""}).fadeIn(550),init_refinery_admin()}})},trigger_reordering=function(t,e){$menu=$("#menu"),t.preventDefault(),$("#menu_reorder, #menu_reorder_done").toggle(),$("#site_bar, #content").fadeTo(500,e?.35:1),e?$menu.find(".tab a").click(function(t){t.preventDefault()}):$menu.find(".tab a").unbind("click"),$menu.sortable(e?"enable":"disable")},trigger_reordering_content_section=function(t,e){$menu=$("#page-tabs").sortable(),t.preventDefault(),$("#reorder_page_part, #reorder_page_part_done").toggle(),$("#site_bar, #menu, .field:not(:has(#page-tabs)), .page_part:visible, #more_options_field, .form-actions").fadeTo(500,e?.35:1),$menu.sortable(e?"enable":"disable").sortable({items:"li",stop:function(){$("#page-tabs li[data-index]").each(function(t){$("#page_parts_attributes_"+$(this).data("index")+"_position").val(t+1)})}})},submit_and_continue=function(t,e){$(this).hasClass("wymupdate")&&$.each(WYMeditor.INSTANCES,function(t,e){e.update()}),$("#continue_editing").val(!0),$("#flash").fadeOut(250),$(".fieldWithErrors").removeClass("fieldWithErrors").addClass("field"),$("#flash_container .errorExplanation").remove(),$.post($("#continue_editing").get(0).form.action,$($("#continue_editing").get(0).form).serialize(),function(t){($flash_container=$("#flash_container")).length>0&&($flash_container.html(t),$("#flash").css({width:"auto",visibility:null}).fadeIn(550),$(".errorExplanation").not($("#flash_container .errorExplanation")).remove(),null!=(error_fields=$("#fieldsWithErrors").val())?$.each(error_fields.split(","),function(){$("#"+this).wrap("<div class='fieldWithErrors' />")}):e&&(window.location=e),$(".fieldWithErrors:first :input:first").focus(),$("#continue_editing").val(!1),init_flash_messages(),$("form").attr("action",$("#new_action").attr("value")))},"html"),t.preventDefault()},init_tooltips=function(t){$($(null!=t?t:"a[title], span[title], #image_grid img[title], *[tooltip]")).not(".no-tooltip").each(function(t,e){$(e).hover(function(t){"mouseenter"==t.type||"mouseover"==t.type?$(this).oneTime(350,"tooltip",$.proxy(function(){$(".tooltip").remove(),tooltip=$("<div class='tooltip'><div><span></span></div></div>").appendTo("#tooltip_container"),tooltip.find("span").html($(this).attr("tooltip")),tooltip_nib_extension=$.browser.msie?".gif":".png",nib=$("<img src='/assets/refinery/tooltip-nib"+tooltip_nib_extension+"' class='tooltip-nib'/>").appendTo("#tooltip_container"),tooltip.css({opacity:0,maxWidth:"300px"}),required_left_offset=$(this).offset().left-tooltip.outerWidth()/2+$(this).outerWidth()/2,tooltip.css("left",required_left_offset>0?required_left_offset:0);var t=tooltip.offset(),e=tooltip.outerWidth();t&&t.left+e>(window_width=$(window).width())&&tooltip.css("left",window_width-e),tooltip.css({top:$(this).offset().top-tooltip.outerHeight()-10}),nib.css({opacity:0}),(t=tooltip.offset())&&nib.css({left:$(this).offset().left+$(this).outerWidth()/2-5,top:t.top+tooltip.height()});try{tooltip.animate({top:t.top-10,opacity:1},200,"swing"),nib.animate({top:nib.offset().top-10,opacity:1},200)}catch(i){tooltip.show(),nib.show()}},$(this))):("mouseleave"==t.type||"mouseout"==t.type)&&($(this).stopTime("tooltip"),null==(tt_offset=(tooltip=$(".tooltip")).css("z-index","-1").offset())&&(tt_offset={top:0,left:0}),tooltip.animate({top:tt_offset.top-20,opacity:0},125,"swing",function(){$(this).remove()}),null==(nib_offset=(nib=$(".tooltip-nib")).offset())&&(nib_offset={top:0,left:0}),nib.animate({top:nib_offset.top-20,opacity:0},125,"swing",function(){$(this).remove()}))}).click(function(){$(this).stopTime("tooltip")}),null==$(e).attr("tooltip")&&$(e).attr("tooltip",$(e).attr("title")),$elements=$(e).add($(e).children("img")).removeAttr("title"),$.browser.msie&&$elements.removeAttr("alt")})};var link_tester={email_re:new RegExp(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i),url_re:new RegExp(/^(https?|ftp):\/\/(-\.)?([^\s/?\.#-]+\.?)+(\/[^\s]*)?$/i),page_re:new RegExp("^(https?://"+document.location.host+"|/[a-z0-9]+)"),email:function(t,e){""!=t&&e(link_tester.email_re.test(t))},url:function(t,e){""!=t&&(link_tester.page_re.test(t)?link_tester.page(t,e):e(link_tester.url_re.test(t)))},page:function(t,e){var i=!1;$.ajax({url:t,timeout:5e3,success:function(){i=!0},complete:function(){e(i)}})},validate_textbox:function(t,e,i){var n="",s=$("<img id='"+e.replace("#","")+"_test_loader' src='/assets/refinery/ajax-loader.gif' alt='Testing...' style='display: none;'/>"),o=$("<span id='"+e.replace("#","")+"_test_result'></span>");s.insertAfter($(e)),o.insertAfter(s),$(e).bind("paste blur",function(){$(e).stop(!0),$(e+"_test_loader").hide(),$(e+"_test_result").hide(),$(e+"_test_result").removeClass("success_icon").removeClass("failure_icon"),""!=this.value&&$(e).delay(300).queue(function(){$(e+"_test_loader").show(),$(e+"_test_result").hide(),$(e+"_test_result").removeClass("success_icon").removeClass("failure_icon"),t(this.value,function(t){n=t?"success_icon":"failure_icon",$(e+"_test_result").addClass(n).show(),$(e+"_test_loader").hide()}),i&&i($(e)),$(this).dequeue()})})},validate_url_textbox:function(t,e){link_tester.validate_textbox(link_tester.url,t,e)},validate_email_textbox:function(t,e){link_tester.validate_textbox(link_tester.email,t,e)}},link_dialog={initialised:!1,init:function(){this.initialised||(this.init_tabs(),this.init_resources_submit(),this.init_close(),this.page_tab(),this.web_tab(),this.email_tab(),this.initialised=!0)},init_tabs:function(){var t=$("#dialog_menu_left input:radio"),e=t.parent().filter(".selected_radio").find("input:radio").first()||t.first();t.click(function(){link_dialog.switch_area($(this))}),e.attr("checked","true"),link_dialog.switch_area(e)},init_resources_submit:function(){$("#existing_resource_area .form-actions-dialog #submit_button").click(function(t){t.preventDefault(),(resource_selected=$("#existing_resource_area_content ul li.linked a")).length>0&&(resourceUrl=parseURL(resource_selected.attr("href")),relevant_href=resourceUrl.pathname,resourceUrl.hostname.match(/s3.amazonaws.com/)&&(relevant_href=resourceUrl.protocol+"//"+resourceUrl.host+relevant_href),"function"==typeof resource_picker.callback&&resource_picker.callback({id:resource_selected.attr("id").replace("resource_",""),href:relevant_href,html:resource_selected.html()})),$(".form-actions-dialog #cancel_button").trigger("click")})},init_close:function(){$(".form-actions-dialog #cancel_button").not(".wym_iframe_body .form-actions-dialog #cancel_button").click(close_dialog),parent&&parent.document.location.href!=document.location.href&&null!=parent.document.getElementById("wym_dialog_submit")&&($("#dialog_container .form-actions input#submit_button").click(function(t){t.preventDefault(),$(parent.document.getElementById("wym_dialog_submit")).click()}),$("#dialog_container .form-actions a.close_dialog").click(close_dialog))},switch_area:function(t){$("#dialog_menu_left .selected_radio").removeClass("selected_radio"),$(t).parent().addClass("selected_radio"),$("#dialog_main .dialog_area").hide(),$("#"+$(t).val()+"_area").show()},page_tab:function(){$(".link_list li").click(function(t){t.preventDefault(),$(".link_list li.linked").removeClass("linked"),$(this).addClass("linked");var e=$(this).children("a.page_link").get(0),i=window.location.port.length>0?":"+window.location.port:"",n=e.href.replace(window.location.protocol+"//"+window.location.hostname+i,"");link_dialog.update_parent(n,e.rel.replace(/\ ?<em>.+?<\/em>/,""))})},web_tab:function(){link_tester.validate_url_textbox("#web_address_text",function(){}),$("#web_address_text, #web_address_target_blank").change(function(){link_dialog.update_parent($("#web_address_text").val(),$("#web_address_text").val(),$("#web_address_target_blank").get(0).checked?"_blank":"")})},email_tab:function(){link_tester.validate_email_textbox("#email_address_text",function(){}),$("#email_address_text, #email_default_subject_text, #email_default_body_text").change(function(){var t=$("#email_default_subject_text").val(),e=$("#email_default_body_text").val(),i=$("#email_address_text").val();modifier="?",additional="",t.length>0&&(additional+=modifier+"subject="+t,modifier="&"),e.length>0&&(additional+=modifier+"body="+e,modifier="&");for(var n="",s=0;s<i.length;s++)n+="%"+i.charCodeAt(s).toString(16);link_dialog.update_parent("mailto:"+n+additional,i)})},update_parent:function(t,e,i){null!=parent&&(null!=(wym_href=parent.document.getElementById("wym_href"))&&(wym_href.value=t),null!=(wym_title=parent.document.getElementById("wym_title"))&&(wym_title.value=e),null!=(wym_target=parent.document.getElementById("wym_target"))&&(wym_target.value=i||""))}},page_options={initialised:!1,init:function(t,e,i){this.initialised||(page_options.tabs=$("#page-tabs").tabs(),part_shown=$("#page-tabs .page_part.field").not(".ui-tabs-hide"),$("#page-tabs .page_part.field").removeClass("ui-tabs-hide"),this.enable_parts=t,this.new_part_url=e,this.del_part_url=i,this.show_options(),$(document).ready($.proxy(function(){$("#page-tabs .page_part.field").not(this).addClass("ui-tabs-hide")},part_shown)),this.enable_parts&&this.page_part_dialog(),this.initialised=!0)},show_options:function(){$("#toggle_advanced_options").click(function(t){t.preventDefault(),$("#more_options").animate({opacity:"toggle",height:"toggle"},250),$("html,body").animate({scrollTop:$("#toggle_advanced_options").parent().offset().top},250)})},page_part_dialog:function(){$("#new_page_part_dialog").dialog({title:"Create Content Section",modal:!0,resizable:!1,autoOpen:!1,width:600,height:200}),$("#add_page_part").click(function(t){t.preventDefault(),$("#new_page_part_dialog").dialog("open")}),$("#new_page_part_save").click(function(t){t.preventDefault();var e=$("#new_page_part_title").val();if(e.length>0){var i=e.toLowerCase().replace(" ","_");0===$("#page_part_"+i).size()?$.get(page_options.new_part_url,{title:e,part_index:$("#new_page_part_index").val(),body:""},function(t){$("#submit_continue_button").remove(),$("#page_part_editors").append(t),page_options.tabs.find("ul").append("<li><a href='#page_part_new_"+$("#new_page_part_index").val()+"'>"+e+"</a></li>"),page_options.tabs.tabs("refresh"),$("#page-tabs #page_parts li").last().attr("data-index",$("#new_page_part_index").val()),page_options.tabs.tabs("option","active",-1),WYMeditor.init(),$("#new_page_part_index").val(parseInt($("#new_page_part_index").val(),10)+1),$("#new_page_part_title").val(""),$("#new_page_part_dialog").dialog("close")},"html"):alert("A content section with that title already exists, please choose another.")}else alert("You have not entered a title for the content section, please enter one.")}),$("#new_page_part_cancel").click(function(t){t.preventDefault(),$("#new_page_part_dialog").dialog("close"),$("#new_page_part_title").val("")}),$("#delete_page_part").click(function(t){t.preventDefault();var e=page_options.tabs.find(".ui-tabs-active a").text();if(confirm("This will remove the content section '"+e+"' immediately even if you don't save this page, are you sure?")){var i=page_options.tabs.find(".ui-tabs-active a").attr("id").match(/\d+/)[0]-1;$("#page_parts_attributes_"+i+"_id").length>0&&$.ajax({url:page_options.del_part_url+"/"+$("#page_parts_attributes_"+i+"_id").val(),type:"DELETE"}),page_options.tabs.find(".ui-tabs-active").remove(),page_options.tabs.find("#page_part_"+e.toLowerCase()).remove(),page_options.tabs.find("#page_part_new_"+i).remove(),$("[id^=page_parts_attributes_"+i+"_]").remove(),$("#submit_continue_button").remove(),page_options.tabs.tabs("refresh")}}),$("#reorder_page_part").click(function(t){trigger_reordering_content_section(t,!0)}),$("#reorder_page_part_done").click(function(t){trigger_reordering_content_section(t,!1)})}},image_picker={initialised:!1,options:{selected:"",thumbnail:"medium",field:"#image",image_display:".current_picked_image",no_image_message:".no_picked_image_selected",image_container:".current_image_container",remove_image_button:".remove_picked_image",picker_container:".image_picker_container",image_link:".current_image_link",image_toggler:null},init:function(t){return this.initialised||(this.options=$.extend(this.options,t),$(this.options.picker_container).find(this.options.remove_image_button).click($.proxy(this.remove_image,{container:this.options.picker_container,picker:this})),$(this.options.picker_container).find(this.options.image_toggler).click($.proxy(this.toggle_image,{container:this.options.picker_container,picker:this})),this.initialised=!0),this},remove_image:function(t){t.preventDefault(),$(this.container).find(this.picker.options.image_display).removeClass("brown_border").attr({src:"",width:"",height:""}).css({width:"auto",height:"auto"}).hide(),$(this.container).find(this.picker.options.field).val("").trigger("change"),$(this.container).find(this.picker.options.no_image_message).show(),$(this.container).find(this.picker.options.remove_image_button).hide()},toggle_image:function(t){$(this.container).find(this.picker.options.image_toggler).html("Show"==$(this.container).find(this.picker.options.image_toggler).html()?"Hide":"Show"),$(this.container).find(this.picker.options.image_container).toggle(),t.preventDefault()},changed:function(){$(this.container).find(this.picker.options.field).val(this.image.id.replace("image_","")).trigger("change");var t=this.picker.options.thumbnail||"original";this.image.src=$(this.image).attr("data-"+t),current_image=$(this.container).find(this.picker.options.image_display),current_image.replaceWith($("<img src='"+this.image.src+"?"+Math.floor(1e5*Math.random())+"' id='"+current_image.attr("id")+"' class='"+this.picker.options.image_display.replace(/^./,"")+" brown_border' />")),$(this.container).find(this.picker.options.remove_image_button).show(),$(this.container).find(this.picker.options.no_image_message).hide()}},resource_picker={initialised:!1,callback:null,init:function(t){this.initialised||(this.callback=t,this.initialised=!0)}};close_dialog=function(t){iframed()?(the_body=$(parent.document.body),the_dialog=parent.$(".ui-dialog-content")):(the_body=$(document.body).removeClass("hide-overflow"),the_dialog=$(".ui-dialog-content"),the_dialog.filter(":data(dialog)").dialog("close"),the_dialog.remove()),$(document.body).hasClass("wym_iframe_body")||(the_body.removeClass("hide-overflow"),the_dialog.filter(":data(dialog)").dialog("close"),the_dialog.remove(),t&&t.preventDefault&&t.preventDefault())},parseURL=function(t){var e={href:t},i=t.replace("//","/").split("/");e.protocol=i[0],e.host=i[1],i[1]=i[1].split(":"),e.hostname=i[1][0],e.port=i[1].length>1?i[1][1]:"",i.splice(0,2),e.pathname="/"==e.href[0]?"/"+e.host:"",e.pathname+="/"+i.join("/"),e.pathname=e.pathname.split("#"),e.hash=e.pathname.length>1?"#"+e.pathname[1]:"",e.pathname=e.pathname[0],e.pathname=e.pathname.split("?"),e.search=e.pathname.length>1?"?"+e.pathname[1]:"",e.pathname=e.pathname[0];var n=t.split("?")[1];return e.options=n,e},iframed=function(){return parent&&parent.document&&parent.document.location.href!=document.location.href&&$.isFunction(parent.$)};