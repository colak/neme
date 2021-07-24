if (class_exists('\Textpattern\Tag\Registry')) {
  Txp::get('\Textpattern\Tag\Registry')
    ->register('fha_time_diff');
}


function fha_time_diff($atts) {

	if (is_array($atts)) extract($atts);

/*
	// declare your language here (e. g. 'de' for German etc.)
	$l = 'en';
	$words[] = $l;
	$words[$l] = array('simpleplurals','year','month','day','hour','minute','override','since','until','attach','last');
	// an integer for simple plurals - enter the first number that uses a plural form (usually 2)
	// or zero to activate last-digit specific forms (e. g. for Czech language)
	$words[$l]['simpleplurals'] = 2;
	// replace numbers with appropriate word forms for these amounts (e. g. 'years', 'year' etc.)
	// if using simpleplurals, only first two entries need to be entered (0 is plural form, 1 is singular form)
	$words[$l]['year']   = array('0','1','2','3','4','5','6','7','8','9');
	$words[$l]['month']  = array('0','1','2','3','4','5','6','7','8','9');
	$words[$l]['day']    = array('0','1','2','3','4','5','6','7','8','9');
	$words[$l]['hour']   = array('0','1','2','3','4','5','6','7','8','9');
	$words[$l]['minute'] = array('0','1','2','3','4','5','6','7','8','9');
	// if NOT using simpleplurals, fill array with numbers, which ALWAYS get a plural form (ignoring the ending digit)
	$words[$l]['override'] = array(11,12,13,14);
	// words to attach to the final result in case of a past/future event date
	$words[$l]['since'] = '';
	$words[$l]['until'] = '';
	// position where to attach the above words, valid values are 'before' and 'after'
	$words[$l]['attach'] = '';
	// word to use as a final delimiter (before the last used date/item item)
	$words[$l]['last'] = '';
*/
	
	$l = 'en';
	$words[] = $l;
	$words[$l] = array('simpleplurals','year','month','day','hour','minute','override','since','until','attach','last');
	$words[$l]['simpleplurals'] = 2;
	$words[$l]['year']   = array('years','year');
	$words[$l]['month']  = array('months','month');
	$words[$l]['day']    = array('days','day');
	$words[$l]['hour']   = array('hours','hour');
	$words[$l]['minute'] = array('minutes','minute');
	$words[$l]['override'] = array(0);
	$words[$l]['since'] = 'since';
	$words[$l]['until'] = 'until';
	$words[$l]['attach'] = 'after';
	$words[$l]['last'] = ' and ';

	$l = 'de';
	$words[] = $l;
	$words[$l] = array('simpleplurals','year','month','day','hour','minute','override','since','until','attach','last');
	$words[$l]['simpleplurals'] = 2;
	$words[$l]['year']   = array('Jahre','Jahr');
	$words[$l]['month']  = array('Monate','Monat');
	$words[$l]['day']    = array('Tage','Tag');
	$words[$l]['hour']   = array('Stunden','Stunde');
	$words[$l]['minute'] = array('Minuten','Minute');
	$words[$l]['override'] = array(0);
	$words[$l]['since'] = 'schon';
	$words[$l]['until'] = 'noch';
	$words[$l]['attach'] = 'before';
	$words[$l]['last'] = ' und ';

	$l = 'cz';
	$words[] = $l;
	$words[$l] = array('simpleplurals','year','month','day','hour','minute','override','since','until','attach','last');
	$words[$l]['simpleplurals'] = 0;
	$words[$l]['year']   = array('let','rok','roky','roky','roky','let','let','let','let','let');
	$words[$l]['month']  = array('m?síc?','m?síc','m?síce','m?síce','m?síce','m?síc?','m?síc?','m?síc?','m?síc?','m?síc?');
	$words[$l]['day']    = array('dn?','den','dny','dny','dny','dn?','dn?','dn?','dn?','dn?');
	$words[$l]['hour']   = array('hodin','hodina','hodiny','hodiny','hodiny','hodin','hodin','hodin','hodin','hodin');
	$words[$l]['minute'] = array('minut','minuta','minuty','minuty','minuty','minut','minut','minut','minut','minut');
	$words[$l]['override'] = array(11,12,13,14);
	$words[$l]['since'] = 'ji?';
	$words[$l]['until'] = 'je?t?';
	$words[$l]['attach'] = 'before';
	$words[$l]['last'] = ' a ';
	
	$l = 'nl';
	$words[] = $l;
	$words[$l] = array('simpleplurals','year','month','day','hour','minute','override','since','until','attach','last');
	$words[$l]['simpleplurals'] = 2;
	$words[$l]['year']   = array('jaar','jaar');
	$words[$l]['month']  = array('maanden','maand');
	$words[$l]['day']    = array('dagen','dag');
	$words[$l]['hour']   = array('uur','uur');
	$words[$l]['minute'] = array('minuten','minuut');
	$words[$l]['override'] = array(0);
	$words[$l]['since'] = '';
	$words[$l]['until'] = '';
	$words[$l]['attach'] = 'before';
	$words[$l]['last'] = '';


	if (empty($lang)) $lang = LANG;
	if (!in_array(strtolower($lang), $words)) $lang = 'en';
		else $lang = strtolower($lang);
	if (empty($simpleplurals)) $simpleplurals = $words[$lang]['simpleplurals'];
	if (empty($last)) $last = (empty($delimiter)) ? $words[$lang]['last'] : $delimiter;
	if (empty($delimiter)) $delimiter = ', ';
	if (empty($class)) $classWord = '';
		else $classWord = " class=\"$class\"";
	if (empty($wraptag)) {
		$wrapOpen = '';
		$wrapClose = '';
	}
	else {
		$wrapOpen = "<$wraptag$classWord>";
		$wrapClose = "</$wraptag>";
	}
	if (empty($attach)) $attach = 'no';
	  elseif ($attach == 'auto') $attach = $words[$lang]['attach'];
	if (empty($since)) $since = $words[$lang]['since'];
	if (empty($until)) $until = $words[$lang]['until'];
	if (empty($limit) || $limit < 1) $limit = 5;

	if (!empty($posted)) {
		global $thisarticle;
		$year = date('Y', $thisarticle['posted']);
		$month = date('n', $thisarticle['posted']);
		$day = date('j', $thisarticle['posted']);
		$hour = date('G', $thisarticle['posted']);
		$minute = date('i', $thisarticle['posted']);
	}

	$today = (!empty($from)) ? strtotime($from) : time();
	$todayYear    = date('Y', $today);
	$todayMonth  = date('n', $today);
	$todayDay    = date('j', $today);
	$todayHour   = date('G', $today);
	$todayMinute = date('i', $today);
	$monthday    = date('md', $today);

	if (isset($month)) $month = str_pad($month,2,'0',STR_PAD_LEFT);
	if (isset($day)) $day = str_pad($day,2,'0',STR_PAD_LEFT);
	if (isset($hour)) $hour = str_pad($hour,2,'0',STR_PAD_LEFT);
	if (isset($minute)) $minute = str_pad($minute,2,'0',STR_PAD_LEFT);
	$m = (isset($minute)?$minute:'00');
	$hm = (isset($hour)?$hour:'00').$m;
	$dhm = (isset($day)?$day:'01').$hm;
	$mdhm = (isset($month)?$month:'01').$dhm;
	$past = (strtotime((isset($year)?$year:'00').'-'.(isset($month)?$month:'01').'-'.(isset($day)?$day:'01').' '.(isset($hour)?$hour:'00').':'.(isset($minute)?$minute:'00')) < time()) ? (true) : (false);

	if (isset($year) && $limit > 0) {

		$years = abs($todayYear - $year);
		if (($past && date('mdHi', $today) < $mdhm) || (!$past && date('mdHi', $today) > $mdhm)) $years--;

		if (!$simpleplurals) {
			$yearWord = ($years > 0) ? $words[$lang]['year'][substr($years,-1)] : '';
			if (in_array(substr($years,-2),$words[$lang]['override']) !== false) $yearWord = $words[$lang]['year'][0];
		}
		else $yearWord = ($years < $simpleplurals) ? $words[$lang]['year'][1] : $words[$lang]['year'][0];

		if ($years > 0) $limit--;


		if (isset($month) && $limit > 0) {

			if ($past) $months = ($todayMonth > $month) ? ($todayMonth - $month) : (12 - $month + $todayMonth);
			else       $months = ($todayMonth < $month) ? ($month - $todayMonth) : (12 - $todayMonth + $month);

			if (($past && date('dHi', $today) < $dhm) || (!$past && date('dHi', $today) > $dhm)) $months--;
			if ($months == 12) $months = 0;

			if (!$simpleplurals) {
				$monthWord = ($months > 0) ? $words[$lang]['month'][substr($months,-1)] : '';
				if (in_array(substr($months,-2),$words[$lang]['override']) !== false) $monthWord = $words[$lang]['month'][0];
			}
			else $monthWord = ($months < $simpleplurals) ? $words[$lang]['month'][1] : $words[$lang]['month'][0];

			if ($months > 0) $limit--;


			if (isset($day) && $limit > 0) {

				if ($past) $days = ($todayDay > $day) ? ($todayDay - $day) : (date('t', strtotime("$year/$month/$day")) - $day + $todayDay);
				else       $days = ($todayDay < $day) ? ($day - $todayDay) : (date('t', strtotime(($month==1)?($year-1):($year).'/'.($month==1)?(12):($month-1).'/'.$day)) - $todayDay + $day);
				if (($past && date('Hi', $today) < $hm) || (!$past && date('Hi', $today) > $hm)) $days--;
				$compDate = ($past) ? date('t', strtotime("$year/$month/$day")) : date('t', strtotime(($month==1)?($year-1):($year).'/'.($month==1)?(12):($month-1).'/'.$day));
				if ($days == $compDate) $days = 0;

				if (!$simpleplurals) {
					$dayWord = ($days > 0) ? $words[$lang]['day'][substr($days,-1)] : '';
					if (in_array(substr($days,-2),$words[$lang]['override']) !== false) $dayWord = $words[$lang]['day'][0];
				}
				else $dayWord = ($days < $simpleplurals) ? $words[$lang]['day'][1] : $words[$lang]['day'][0];

				if ($days > 0) $limit--;


				if (isset($hour) && $limit > 0) {

					if ($past) $hours = ($todayHour > $hour) ? ($todayHour - $hour) : (24 - $hour + $todayHour);
					else       $hours = ($todayHour < $hour) ? ($hour - $todayHour) : (24 - $todayHour + $hour);

					if (($past && date('i', $today) < $minute) || (!$past && date('i', $today) > $minute)) $hours--;
					if ($hours == 24) $hours = 0;

					if (!$simpleplurals) {
						$hourWord = ($hours > 0) ? $words[$lang]['hour'][substr($hours,-1)] : '';
						if (in_array(substr($hours,-2),$words[$lang]['override']) !== false) $hourWord = $words[$lang]['hour'][0];
					}
					else $hourWord = ($hours < $simpleplurals) ? $words[$lang]['hour'][1] : $words[$lang]['hour'][0];

					if ($hours > 0) $limit--;


					if (isset($minute) && $limit > 0) {

						if ($past) $minutes = ($todayMinute > $minute) ? ($todayMinute - $minute) : (60 - $minute + $todayMinute);
						else       $minutes = ($todayMinute < $minute) ? ($minute - $todayMinute) : (60 - $todayMinute + $minute);
						if ($minutes == 60) $minutes = 0;

						if (!$simpleplurals) {
							$minuteWord = ($minutes > 0) ? $words[$lang]['minute'][substr($minutes,-1)] : '';
							if (in_array(substr($minutes,-2),$words[$lang]['override']) !== false) $minuteWord = $words[$lang]['minute'][0];
						}
						else $minuteWord = ($minutes < $simpleplurals) ? $words[$lang]['minute'][1] : $words[$lang]['minute'][0];

					}
				}
			}
		}
	}

	if (!empty($minutes)) $out = (empty($out)) ? ("$last$minutes $minuteWord") : ("$delimiter$minutes $minuteWord$out");
	if (!empty($hours)) $out = (empty($out)) ? ("$last$hours $hourWord") : ("$delimiter$hours $hourWord$out");
	if (!empty($days)) $out = (empty($out)) ? ("$last$days $dayWord") : ("$delimiter$days $dayWord$out");
	if (!empty($months)) $out = (empty($out)) ? ("$last$months $monthWord") : ("$delimiter$months $monthWord$out");
	if (!empty($years)) $out = (empty($out)) ? ("$years $yearWord") : ("$years $yearWord$out");

	$testOut = strstr($out, $delimiter);
	if (strlen($testOut) == strlen($out)) $out = substr($out, strlen($delimiter));
	$testOut = strstr($out, $last);
	if (strlen($testOut) == strlen($out)) $out = substr($out, strlen($last));

	if ($attach == 'before') $out = ($past) ? ("$since $out") : ("$until $out");
	elseif ($attach == 'after') $out = ($past) ? ("$out $since") : ("$out $until");

	return $wrapOpen.trim($out).$wrapClose;
}
