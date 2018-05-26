<txp:php>
    global $com_connect_form;
    switch($com_connect_form['Organisation'])
    {
        case 'Project coordinator':
            echo 'admin@organisations.org';
            break;
        case 'Aksioma':
            echo 'email@organisation1.org';
            break;
        case 'Drugo More':
            echo 'email@organisation2.org';
            break;
        case 'Furtherfield':
            echo 'email@organisation3.org';
            break;
        case 'Institute of Network Cultures':
            echo 'email@organisation4.org';
            break;
        case 'NeMe':
            echo 'email@organisation5.org';
            break;
        default:
            echo 'default@organisation.org';
    }
</txp:php>
