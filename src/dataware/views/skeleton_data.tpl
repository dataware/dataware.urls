<table class="table table-bordered">
            <thead>
                <tr>
                    <th>ts</th>
                    <th>name</th>
                    <th>value</th>
                </tr>
            </thead>
            <tbody>
                %for item in data:
                <tr>
                    <td>{{item['ts']}}</td>
                    <td>{{item['name']}}</td>
                    <td>{{item['value']}}</td>
                </tr>
                %end
            </tbody>
        </table>  
