<template>
  <v-layout column justify-center align-center>
    <h2>
      Categories :
    </h2>
    <v-data-table :headers="headers" :items="categories" class="elevation-1">
      <template slot="items" slot-scope="props">
        <td>
          {{ props.item.id }}
        </td>
        <td class="text-xs-right">
          {{ props.item.label }}
        </td>
        <td class="text-xs-right">
          {{ props.item.minimumPrice }}
        </td>
        <td class="text-xs-right">
          {{ props.item.maximumPrice }}
        </td>
        <td class="text-xs-right">
          {{ props.item.unit }}
        </td>
        <td class="text-xs-right">
          {{ props.item.placeholder }}
        </td>
        <td class="text-xs-right">
          {{ props.item.createdAt }}
        </td>
        <td class="text-xs-right">
          {{ props.item.updatedAt }}
        </td>
      </template>
    </v-data-table>
  </v-layout>
</template>
<script>
export default {
  data() {
    return {
      headers: [
        { text: "Id", align: "left", sortable: true, value: "id" },
        { text: "Label", value: "label" },
        { text: "Minimum Price", value: "minimumPrice" },
        { text: "Maximum Price", value: "maximumPrice" },
        { text: "Unit", value: "unit" },
        { text: "Placeholder", value: "placeholder" },
        { text: "Created at", value: "createdAt" },
        { text: "Updated at", value: "updatedAt" }
      ],
      categories: [],
      errors: []
    }
  },
  // Fetches categories when the component is created.
  async created() {
    try {
      const response = await this.$axios.$get("/categories")
      this.categories = response
    } catch (e) {
      this.errors.push(e)
    }
  }
}
</script>
