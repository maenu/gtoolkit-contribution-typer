Extension { #name : #BrGlamorousColors }

{ #category : #'*Typer-GToolkit' }
BrGlamorousColors class >> gtColorsFor: aView [
	<gtView>
	<gtClassView>
	^ aView columnedList
		title: 'Colors';
		priority: 0.5;
		items: [ (self class selectors
				select: [ :each | each numArgs isZero and: [ each endsWith: 'Color' ] ])
				sorted ];
		column: 'Icon'
			icon: [ :aSymbol | (self perform: aSymbol) gtInspectorIcon asElement asScalableElement ]
			width: 32;
		column: 'Selector' text: [ :aSymbol | aSymbol asString ];
		send: [ :aSymbol | self perform: aSymbol ]
]
