Class {
	#name : #TypGtAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type',
		'nodes'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtAttribute class >> nodes: aCollection [
	^ self nodes: aCollection type: (aCollection collect: #type) typAsMinimizedType
]

{ #category : #'as yet unclassified' }
TypGtAttribute class >> nodes: aNode type: aType [

	^ self new
		  initializeNodes: aNode type: aType;
		  yourself
]

{ #category : #initialization }
TypGtAttribute >> initialize [
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
				aptitude: (BrGlamorousLabelAptitude new
						foreground: Color gray;
						yourself) + GtExplainerLinesAptitude new beForExplanation;
				text: type printString asRopedText glamorousCodeFont;
				beMiniSize;
				hFitContent;
				vFitContent;
				margin: (BlInsets
						top: 3.3
						left: 2
						bottom: 0
						right: (self shouldAppend ifTrue: [ 0 ] ifFalse: [ 2 ]));
				when: BlClickEvent
					do: [ :e | 
						e target phlow
							spawnObject: (nodes size = 1 ifTrue: [ nodes anyOne ] ifFalse: [ nodes ]) ];
				yourself ]
]

{ #category : #initialization }
TypGtAttribute >> initializeNodes: aCollection type: aType [

	nodes := aCollection.
	type := aType
]
