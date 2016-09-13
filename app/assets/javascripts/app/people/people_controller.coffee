unless window.App
  window.App = {}

class App.PeopleController extends Spine.Controller
  constructor: (options) ->
    super(options)
    #console.info "hi: el.id = #{@el.attr('id')}"

    @el.bootstrapTable
      url: 'people.json'
      sortName: 's_n'
      pagination: true
      sidePagination: 'server'
      pageSize: 20
      filterControl: true
      columns: [
        {
          field: 's_n'
          title: 'SN'
          sortable: true
          #filterControl: 'input'
        }
        {
          field: 'register_number'
          title: 'Register'
          sortable: true
          filterControl: 'input'
        }
        {
          field: 'first_name'
          title: 'First name'
          sortable: true
          filterControl: 'input'
        }
        {
          field: 'family_name'
          title: 'Family name'
          sortable: true
          filterControl: 'input'
        }
        {
          field: 'contact_persons'
          title: 'Contact'
        }
        {
          field: 'lawyer'
          title: 'Lawyer'
          sortable: true
          filterControl: 'select'
          filterData: 'url:people/lawyers.json'
        }
        {
          field: 'created_at'
          title: 'Created At'
          sortable: true
        }
        {
          field: 'updated_at'
          title: 'Updated At'
          sortable: true
        }
        {
          field: 'comments_count'
          title: 'Comments'
          sortable: true
          formatter: (value, row, index) ->
            if value == null
              value = 0
            '<span class=\'badge\'>' + value + '</span>'

        }
        {
          field: 'id'
          title: 'Action'
          formatter: (value, row, index) ->
            JST['app/people/views/actions']({
            id: value
            })

        }
      ]


