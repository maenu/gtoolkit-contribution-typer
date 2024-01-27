Extension { #name : #TypTManifest }

{ #category : #'*Typer-GToolkit' }
TypTManifest classSide >> typGtStatisticsFor: aView [
	<gtClassView>
	<gtView>
	^ aView columnedList
		title: 'Statistics';
		priority: 6;
		items: [ (self package definedClasses
				collect: [ :c | c -> c instanceCount ]
				thenReject: [ :a | a value = 0 ]) sorted: [ :a :b | a value > b value ] ];
		column: '#'
			text: #value
			width: 45;
		column: 'Class'
			text: #key
			width: 400;
		sendTool: [ :e | GtClassCoderTool forClass: e key ];
		actionUpdateButton
]

{ #category : #'*Typer-GToolkit' }
TypTManifest classSide >> typGtStatusChildren [
	^ #()
]

{ #category : #'*Typer-GToolkit' }
TypTManifest classSide >> typGtStatusFor: aView [
	<gtClassView>
	<gtView>
	^ aView columnedTree
		title: 'Status';
		priority: 0;
		items: [ {self typGtStatusRoot} ];
		column: 'State'
			icon: [ :c | self typGtStatusIconFor: c first ]
			width: 64;
		column: 'Manifest'
			text: #second
			width: 64;
		column: 'Property'
			text: #third
			width: 128;
		column: 'Description'
			text: #fourth
			width: 256;
		sendTool: [ :c | 
			| object |
			object := c fifth.
			object isClass
				ifTrue: [ GtClassCoderTool forClass: object ]
				ifFalse: [ GtInspectorTool forObject: object ] ];
		children: #sixth;
		expandAll;
		actionUpdateButton
]

{ #category : #'*Typer-GToolkit' }
TypTManifest classSide >> typGtStatusIconFor: anInteger [
	anInteger = 0 ifTrue: [ ^ BrGlamorousIcons empty ].
	anInteger = 1 ifTrue: [ ^ BrGlamorousIcons greencircle ].
	anInteger = 2 ifTrue: [ ^ BrGlamorousIcons yellowcircle ].
	anInteger = 3 ifTrue: [ ^ BrGlamorousIcons redcircle ].
	self error: 'not cool'
]

{ #category : #'*Typer-GToolkit' }
TypTManifest classSide >> typGtStatusRoot [
	| children icon |
	children := self typGtStatusChildren.
	icon := (children collect: #first) sorted ifEmpty: 1 ifNotEmpty: #last.
	^ {icon.
		self shortName.
		''.
		''.
		self.
		children}
]
