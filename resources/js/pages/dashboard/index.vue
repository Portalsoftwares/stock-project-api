<template>
	<div class="text-left mb-4">
		<el-select
			v-model="academic"
			placeholder="ជ្រើសរើស"
			class="text-left "
			@change="changeData"
		>
			<el-option
				v-for="data in academics"
				:key="data"
				:label="data.academic_name"
				:value="data.academic_id"
			/>
		</el-select>
	</div>
	<div
		class=" mb-4 "
		v-loading="loading"
	>
		<el-row :gutter="16">
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
					<el-statistic :value="student.total">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​សិស្សសរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="flex justify-center space-x-4 pt-2">
						<div class="statistic-footer flex justify-center space-x-4">
							<div class="footer-item">
								<span class="text-[16px]">ប្រុស </span>
								<span class="green text-[16px] px-1">
									{{ student.st1 }}
								</span>
								<span class="text-[16px]">នាក់ </span>

							</div>
							<div class="footer-item">
								<span class="text-[16px]">ស្រី </span>
								<span class="green text-[16px] px-1">
									{{ student.st2 }}

								</span>
								<span class="text-[16px]">នាក់ </span>

							</div>
						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
					<el-statistic :value="teacher.total">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​គ្រូសរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="flex justify-center space-x-4 pt-2">
						<div class="statistic-footer flex justify-center space-x-4">
							<div class="footer-item">
								<span class="text-[16px]">ប្រុស </span>
								<span class="green text-[16px] px-1">
									{{ teacher.tc1 }}
								</span>
								<span class="text-[16px] ">នាក់ </span>

							</div>
							<div class="footer-item">
								<span class="text-[16px]">ស្រី </span>
								<span class="green text-[16px] px-1">
									{{ teacher.tc2 }}

								</span>
								<span class="text-[16px]">នាក់ </span>

							</div>
						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
					<el-statistic :value="user.total">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">អ្នកប្រើប្រាស់សរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="flex justify-center space-x-4 pt-2">
						<div class="statistic-footer flex justify-center space-x-4">
							<div class="footer-item">
								<div class="text-[16px] px-2">តួនាទី:</div>
								<div class="flex flex-wrap gap-1 my-2">
									<el-tag
										v-for="item in user.role"
										:key="item.label"
										:type="item.type"
										class="text-[16px]"
										effect="plain"
										round
									>
										{{ item.label }}
									</el-tag>
								</div>
							</div>

						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
					<el-statistic :value="classs.total">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​ថ្នាក់សរុប</div>
							</div>
						</template>
					</el-statistic>
					<div class="flex justify-center space-x-4 pt-2">
						<div class="statistic-footer flex justify-center space-x-4">
							<div class="footer-item">
								<span class="text-[16px]">ធម្មតា </span>
								<span class="green text-[16px]">
									{{ classs.cl1 }}
								</span>
							</div>
							<div class="footer-item">
								<span class="text-[16px]">វិទ្យាសាស្រ្តពិត </span>
								<span class="green text-[16px]">
									{{ classs.cl2 }}
								</span>
							</div>
							<div class="footer-item">
								<span class="text-[16px]">វិទ្យាសាស្រ្តសង្គម </span>
								<span class="green text-[16px]">
									{{ classs.cl3 }}

								</span>
							</div>
						</div>
					</div>
				</div>
			</el-col>
		</el-row>
	</div>
	<div class="grid grid-cols-3 gap-4 ">
		<div class="col-span-2 border rounded  bg-gray-50 p-5 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
			<div class="flex flex-col  ">
				<div class="py-2 text-xl">
					ទិន្នន័យសិស្សានុសិស្សតាមថ្នាក់
				</div>
				<div>
					<apexchart
						type="bar"
						height="350"
						:options="optionsColumn.chartOptions"
						:series="optionsColumn.series"
					></apexchart>
				</div>

			</div>
		</div>
		<div class="border rounded  bg-gray-50 p-5 hover:shadow-md  cursor-pointer transition ease-in-out delay-100">
			<div class="py-2 text-xl">
				ទិន្នន័យអត្រាវត្តមាន
			</div>
			<div
				id="chartAttendace "
				class="flex justify-center items-center"
			>
				<apexchart
					type="pie"
					width="380"
					:options="optionsAttendace.chartOptions"
					:series="optionsAttendace.series"
				></apexchart>
			</div>
		</div>

	</div>

</template>
<script>
export default {
	components: {},

	data() {
		var optionsColumn = {
			series: [{
				name: 'សិស្សប្រុស',
				data: [10, 12, 13]
			},
			{
				name: 'សិស្សស្រី',
				data: [22, 19, 24]
			}
			],
			chartOptions: {
				chart: {
					height: 350,
					type: 'bar',
					fontFamily: 'Khmer OS Siemreap',
					fontSize: '15px',


				},
				legend: {
					position: 'bottom',
					fontSize: '14px',
					fontFamily: 'Khmer OS Siemreap',
				},
				plotOptions: {
					bar: {
						columnWidth: 70,
						borderRadius: 5,
						dataLabels: {
							position: 'top', // top, center, bottom
						},
					}
				},
				dataLabels: {
					enabled: true,
					formatter: function (val) {
						return val + "នាក់";
					},
					offsetY: -20,
					style: {
						fontSize: '15px',
						colors: ["#304758"],
						fontFamily: 'Khmer OS Siemreap',

					}
				},

				xaxis: {
					categories: ["ថ្នាក់ធម្មតា", "ថ្នាក់វិទ្យាសាស្រ្តពិត", "ថ្នាក់វិទ្យាសាស្រ្តសង្គម"],
					style: {
						fontSize: '18px',
						colors: ["#304758"],
						fontFamily: 'Khmer OS Siemreap',

					},
					position: 'top',

					axisBorder: {
						show: false
					},
					axisTicks: {
						show: false
					},
					crosshairs: {
						fill: {
							type: 'gradient',
							gradient: {
								colorFrom: '#D8E3F0',
								colorTo: '#BED1E6',
								stops: [0, 100],
								opacityFrom: 0.4,
								opacityTo: 0.5,
							}
						}
					},
					tooltip: {
						enabled: true,
						style: {
							fontSize: '15px',
							colors: ["#304758"],
							fontFamily: 'Khmer OS Siemreap',

						},

					}
				},
				yaxis: {
					axisBorder: {
						show: false
					},
					axisTicks: {
						show: false,
					},
					labels: {
						show: false,
						style: {
							fontSize: '12px',
							colors: ["#304758"],
							fontFamily: 'Khmer OS Siemreap',

						},
						formatter: function (val) {
							return `<span style="font-family: 'Khmer OS Siemreap'">${val} នាក់</span>`;
						}
					}

				},
				title: {
					text: '',
					floating: true,
					offsetY: 330,
					align: 'center',
					style: {
						color: '#444',
						fontFamily: 'Khmer OS Siemreap',

					}
				}
			},
		};

		var optionsAttendace = {
			series: [],
			chartOptions: {
				chart: {
					width: 400,
					type: 'pie',
					align: "center"
				},
				legend: {
					position: 'bottom',
					fontSize: '14px',
					fontFamily: 'Khmer OS Siemreap',
					fontWeight: 500,
					align: "center"

				},
				labels: ['វត្តមាន', 'ច្បាប់', 'មកយឺត', 'អវត្តមាន'],
				responsive: [{
					breakpoint: 680,
					options: {
						chart: {
							width: 250
						},
						legend: {
							position: 'bottom'
						},
						title: {
							align: 'center'
						}
					}
				}]
			},
		};


		return {
			optionsColumn,
			optionsAttendace,
			academic: 1,
			academics: [
			],
			dataSummary: [],
			student: {
				'total': 0,
				'st1': 0,
				'st2': 0,
			},
			teacher: {
				'total': 0,
				'tc1': 0,
				'tc2': 0,
			},
			user: {
				'total': 0,
				'role': []
			},
			classs: {
				'total': 0,
				'cl1': 0,
				'cl2': 0,
				'cl3': 0,
			},

		}
	},
	computed: {

	},

	mounted() {
		this.getData();
	},
	methods: {
		changeData() {
			this.getData();
		},
		async getData() {
			this.loading = true
			await axios.get('/dashboard' + '?acc=' + this.academic).then(response => {

				this.dataSummary = response.data.data
				this.academics = this.dataSummary.academics
				this.optionsAttendace.series = this.dataSummary.attendance
				this.optionsColumn.series[0].data = this.dataSummary.student_class_type.st1
				this.optionsColumn.series[1].data = this.dataSummary.student_class_type.st2

				this.student.total = this.dataSummary.student.total
				this.student.st1 = this.dataSummary.student.st1
				this.student.st2 = this.dataSummary.student.st2

				this.teacher.total = this.dataSummary.teacher.total
				this.teacher.tc1 = this.dataSummary.teacher.tc1
				this.teacher.tc2 = this.dataSummary.teacher.tc2

				this.user.total = this.dataSummary.user.total
				this.user.role = this.dataSummary.user.role

				this.classs.total = this.dataSummary.class.total
				this.classs.cl1 = this.dataSummary.class.cl1
				this.classs.cl2 = this.dataSummary.class.cl2
				this.classs.cl3 = this.dataSummary.class.cl3

				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
	}
}
</script>
<style >
tspan {
	font-size: 15px !important;
}
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}
.red {
	color: var(--el-color-error);
}
</style>