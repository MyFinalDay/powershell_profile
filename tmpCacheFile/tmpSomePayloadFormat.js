    let condition1 = {
        name: {
            $regex: value,
            $options: "im",
        }
    };
    let condition2 = {
        company: {
            $regex: value,
            $options: "im",
        }
    };
    let payload = {
        "$or": [condition1, condition2]
    };
