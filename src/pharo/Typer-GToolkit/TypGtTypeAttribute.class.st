Class {
	#name : #TypGtTypeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type',
		'nodes'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTypeAttribute class >> nodes: aCollection [
	^ self nodes: aCollection type: (aCollection collect: #type) typAsMinimizedType
]

{ #category : #accessing }
TypGtTypeAttribute class >> nodes: aCollection type: aType [
	^ self new
		initializeNodes: aCollection type: aType;
		yourself
]

{ #category : #initialization }
TypGtTypeAttribute >> initialize [
	<typPraVariable: 'type' as: 'TypType'>
	super initialize.
	self
		beAppend;
		stencil: [ | element |
			element := BrLabel new.
			element userData
				at: #explainer
				put: ((TypGtExplainerElementContext on: element)
						isExplanation: true;
						model: nodes;
						yourself).
			element
				aptitude: BrGlamorousLabelAptitude new + GtExplainerLinesAptitude new beForExplanation;
				text: self text;
				beMiniSize;
				hFitContent;
				vFitContent;
				margin: (BlInsets
						top: 3.3
						left: 2
						bottom: 0
						right: 0);
				when: BlClickEvent
					do: [ :e | 
						e target phlow
							spawnObject: (nodes size = 1 ifTrue: [ nodes anyOne ] ifFalse: [ nodes ]) ];
				yourself ]
]

{ #category : #initialization }
TypGtTypeAttribute >> initializeNodes: aCollection type: aType [
	nodes := aCollection.
	type := aType
]

{ #category : #accessing }
TypGtTypeAttribute >> text [
	^ type typGtAsRopedText glamorousCodeFont
]
