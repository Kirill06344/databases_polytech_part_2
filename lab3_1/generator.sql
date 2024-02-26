CREATE EXTENSION IF NOT EXISTS plpython3u;

do
$$
from datetime import datetime, timezone
import random
import string
import decimal

def get_random_string(length):
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str

rows = 10
for i in range (rows):
    plan = plpy.prepare("INSERT INTO retail_center(type, address) values($1, $2)", ["text", "text"])
    plan.execute([get_random_string(random.randint(2,15)), get_random_string(random.randint(2,15))])

    plan = plpy.prepare("INSERT INTO transportation_event(seq_number, type, delivery_rout) values($1, $2, $3)", ["integer","text", "text"])
    plan.execute([i+1, get_random_string(random.randint(2,15)), get_random_string(random.randint(2,15))])


retail_ids = [row["id"] for row in plpy.execute("SELECT id FROM retail_center")]
events_ids = [row["seq_number"] for row in plpy.execute("SELECT seq_number FROM transportation_event")]

shipped_item_rows = 100
item_transportation = 10000000
try:
    with plpy.subtransaction():
        for i in range (shipped_item_rows):
            plan = plpy.prepare("INSERT INTO shipped_item(item_num, retail_center_id, weight, dimension,"+
            "insurance_amt, destination, final_delivery_date)"+
            "values($1, $2, $3, $4, $5, $6, $7)", ["integer", "integer", "numeric", "numeric", "numeric", "text","timestamp"])

            plan.execute([i+1, random.choice(retail_ids), decimal.Decimal(random.randrange(155, 389))/100, random.uniform(1.25, 100.25),
            random.uniform(1.25, 100.25), get_random_string(random.randint(2,15)), datetime.now(timezone.utc)])
except plpy.SPIError as e:
    result = "error transferring funds: %s" % e.args
else:
    result = "funds transferred correctly"
plpy.info(result)
$$ language plpython3u