CREATE EXTENSION IF NOT EXISTS plpython3u;


do
$$
from datetime import datetime, timezone
import random
import string
import decimal

def rand_str(length):
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str

def rt_data(rows):
    data = []
    for i in range (rows):
        data.append((rand_str(5), rand_str(5)))
    return data

def tr_data(rows):
    data = []
    for i in range (rows):
        data.append((str(i+1), rand_str(5), rand_str(5)))
    return data

def sp_data(rows):
    data = []
    retail_ids = [row["id"] for row in plpy.execute("SELECT id FROM retail_center")]
    for i in range (rows):
        data.append((str(i+1), str(random.choice(retail_ids)), str(decimal.Decimal(random.randrange(155, 389))/100), str(random.uniform(1.25, 100.25)),
            str(random.uniform(1.25, 100.25)), rand_str(random.randint(2,15)), str(datetime.now(timezone.utc))))
    return data

def write_to_csv(random_data, csv_name):
    with open(csv_name, 'w+') as f:
        for record in random_data:
            f.write(','.join(record) + '\n')


rt_data = rt_data(10)
write_to_csv(rt_data, 'retail.csv')
plpy.execute("COPY retail_center(type, address) FROM 'retail.csv' CSV")

tr_data = tr_data(10)
write_to_csv(tr_data, 'transport.csv')
plpy.execute("COPY transportation_event(seq_number, type, delivery_rout) FROM 'transport.csv' CSV")

s_data = sp_data(1000000)
write_to_csv(s_data, 'shipped.csv')
plpy.execute("COPY shipped_item(item_num, retail_center_id, weight, dimension,"+
            "insurance_amt, destination, final_delivery_date) FROM 'shipped.csv' CSV")
$$ language plpython3u