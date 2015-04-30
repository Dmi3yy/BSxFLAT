<!DOCTYPE html>
<html lang="en">
<head>
    <title>MODx CMF Manager Login</title>
    <meta http-equiv="content-type" content="text/html; charset=[+modx_charset+]" />
    <meta name="robots" content="noindex, nofollow" />
    <link rel="stylesheet" href="media/style/BSxFLAT/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="media/style/BSxFLAT/css/bsmanager.css">

    <script src="media/script/mootools/mootools.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
        if (top.frames.length!=0) {
            top.location=self.document.location;
        }

        window.addEvent('domready', function() {
            $('submitButton').addEvent('click', function(e) {
                 e = new Event(e).stop();
                 params = 'ajax=1&' + $('loginfrm').toQueryString();
                 url = 'processors/login.processor.php';
                 new Ajax(url,
                    {
                        method: 'post',
                        postBody: params,
                        onComplete:ajaxReturn
                    }
                ).request();
                $$('input').setProperty('readonly', 'readonly');
            });

			// Initial focus
			if ($('username').value != '') {
				$('password').focus();
			} else {
				$('username').focus();
			}

        });

        function ajaxReturn(response) {
            var header = response.substr(0,9);
            if (header.toLowerCase()=='location:') top.location = response.substr(10);
            else {
                var cimg = $('captcha_image');
                if (cimg) {
                	cimg.src = 'includes/veriword.php?rand=' + Math.random();
                }
                $$('input').removeProperty('readonly');
                alert(response);
            }
        }
    /* ]]> */
    </script>
</head>
<body id="login">

<div class="container">
<div class="row loginpanel">
    <div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
           <div class="panel-heading logintitle">
			    	<h3 class="panel-title"><a href="../" id="site_name">[+site_name+]</a></h3>
			 	</div>
               	<div class="panel-body">
                <form method="post" name="loginfrm" id="loginfrm" action="processors/login.processor.php">
                <fieldset>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="[+username+]" class="text" name="username" id="username" tabindex="1" value="[+uid+]" />
					</div>
					<div class="form-group">
					<input type="password" class="form-control" placeholder="[+password+]" class="text" name="password" id="password" tabindex="2" value="" />
					</div>
					<p class="caption">[+login_captcha_message+]</p>
					<div>
						[+captcha_image+]
					</div>[+captcha_input+]

					<div class="checkbox">
                    <label for="rememberme" class="rememberme">
						<input type="checkbox" id="rememberme" name="rememberme" tabindex="4" value="1" class="checkbox" />
						[+remember_username+]
                        </label>
					</div>
                    <input class="btn btn-lg btn-success btn-block" type="submit" class="login" id="submitButton" value="[+login_button+]" />
                   </fieldset>
                   </form>
				</div>


             </div>
             			<div class="text-success text-center">
					&copy; 2005-2015 by the <a href="http://modx.com/" target="_blank">MODX</a>. MODX&trade; is licensed under the GPL.
				</div>
     </div>

</div>
</div>
</div>
</body>
</html>