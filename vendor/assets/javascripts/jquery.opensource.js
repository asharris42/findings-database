(function(d,a){var c=d.prototype;for(var b in a){if(!d[b]){c[b]=a[b]}}})(Number,{secondsToMinutesString:function(a){return(""+parseInt(a/60)).pad(2,0,true)+":"+(""+parseInt(a)%60).pad(2,0,true)},formatSize:function(a){var c,b=this;if(a===undefined){a=0}var d=["B","kB","MB","GB","TB","PB","EB","ZB","YB"];for(c=0;b>1024&&(d.length>=(c+2));c++){b/=1024}return Math.round(b,a)+d[c]}});if(OPENSOURCE===undefined){var OPENSOURCE=(function(d){var g,b;j();function m(o,n){d(function(){g=o;b=n;a();k();e();f();h();l();b()})}function a(){var n=g.id+" "+g.version;document.title=n;d("h1").html(n.replace(/(\d+\.\d+\.)(\d+)/g,"$1<small>$2</small>"))}function k(){var o=d("<ul/>").appendTo("header>div>nav");d('<li><a href="#"></a></li>').appendTo(o).click(function(){d(document).scrollTop(0)});var n,p;d("body h2,body h3").each(function(t,u){var q=u.nodeName.toLowerCase();var v=d(u);var r=v.attr("title")||v.text();var s=r.replace(/[^a-z0-9]/gi,"");d('<a id="'+s+'" class="hiddenAnchor"/>').prependTo(v);var w=q=="h2";var x=d('<li><a href="#'+s+'">'+r+"</a></li>").appendTo(w?o:p);if(w){n=x;p=d("<ul></ul>")}if(p&&p.find("li").length){p.appendTo(n)}})}function h(){d("#footer>div").html(g.copyright.replace("Ron Valstar",'<a href="http://www.sjeiti.com/">Ron Valstar</a>').replace(/-[0-9]{4}/g,"-"+(new Date()).getFullYear()))}function e(){d('a.download[href*=".zip"]').each(function(n,o){var p=d(o);p.attr("href",p.attr("href").replace(/\d+\.\d+\.\d+/g,g.version))});d("a.choosehref").each(function(n,o){var p=d(o);p.find(":input").change(function(q){p.attr("href",p.find(":input:checked").val())})})}function f(){var n={};d(".filesize").each(function(o,p){var r=d(p);var t=r.data("file")||r.siblings("[value]:first").attr("value")||r.parents("[href]:first").attr("href");function q(v){d.each(v.targets,function(w,x){s(x,v.size)})}function s(w,v){w.text(v.formatSize())}var u=n[t]||null;if(u&&u.loaded){s($El,u.size)}else{if(u){u.targets.push(r)}else{u={loaded:false,targets:[r]};n[t]=u;d.get(t,function(v){u.loaded=true;u.size=v.length;q(u)},"text")}}})}function c(){var n=["scripts/jquery."+g.id+".js","scripts/jquery.opensource.js"];var o=n.length;var p=true;d.each(n,function(q,r){d.get(r,function(s){if(!!s.match(/console.log\(/g)){d("header").css({border:"2px solid red"})}})})}function j(){if(location.href.match(/http:\/\/\w*\.?sjeiti\.com/)){var n=n||[];n.push(["_setAccount","UA-670434-1"]);n.push(["_setDomainName","sjeiti.com"]);n.push(["_trackPageview"]);(function(){var p=document.createElement("script");p.type="text/javascript";p.async=true;p.src=("https:"==document.location.protocol?"https://ssl":"http://www")+".google-analytics.com/ga.js";var o=document.getElementsByTagName("script")[0];o.parentNode.insertBefore(p,o)})()}}function l(){d.getJSON("https://api.flattr.com/rest/v2/things/lookup/?url="+location.href,function(p){if(p.hasOwnProperty("url")){d('<span class="flattrBox"><a class="FlattrButton" href="'+p.url+'"></a></span>').appendTo("#intro>div");var o=document.createElement("script"),n=document.getElementsByTagName("script")[0];o.type="text/javascript";o.async=true;o.src="http://api.flattr.com/js/0.6/load.js?mode=auto";n.parentNode.insertBefore(o,n)}else{console&&console.log&&console.log("Flattr",p.description,"for",location.href)}})}function i(){}return{init:m}})(jQuery)};