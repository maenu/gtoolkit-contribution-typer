Extension { #name : #TypInfManifest }

{ #category : #'*Typer-GToolkit' }
TypInfManifest class >> typGtConfigurationFor: aView [
	<gtClassView>
	<gtView>
	^ aView explicit
		title: 'Configuration';
		priority: 10;
		stencil: [ GtInspectorTool forObject: TypInfConfiguration default ]
]

{ #category : #'*Typer-GToolkit' }
TypInfManifest class >> typGtIndexFor: aView [
	<gtClassView>
	<gtView>
	^ aView explicit
		title: 'Index';
		priority: 10;
		stencil: [ GtInspectorTool forObject: TypInfIndex instance ]
]

{ #category : #'*Typer-GToolkit' }
TypInfManifest class >> typGtStatisticsFor: aView [
	<gtClassView>
	<gtView>
	^ aView columnedList
		title: 'Statistics';
		priority: 10;
		items: [ (self package definedClasses
				collect: [ :c | c -> c instanceCount ]
				thenReject: [ :a | a value = 0 ]) sorted: [ :a :b | a value > b value ] ];
		column: '#'
			text: #value
			width: 45;
		column: 'Class'
			text: #key
			width: 400;
		send: #key;
		actionUpdateButton
]

{ #category : #'*Typer-GToolkit' }
TypInfManifest class >> typGtStatusChildren [
	^ {TypInfIndex hasInstance
			ifTrue: [ {1.
					''.
					#index.
					'initialized'.
					TypInfIndex instance.
					#()} ]
			ifFalse: [ {3.
					''.
					#index.
					'not initialized, build?'.
					nil.
					#()} ]}
]
