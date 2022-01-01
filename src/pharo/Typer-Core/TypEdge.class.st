Class {
	#name : #TypEdge,
	#superclass : #Object,
	#instVars : [
		'data',
		'origin',
		'target'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdge class >> origin: aNode target: anotherNode data: anObject [

	^ self new
		  initializeOrigin: aNode target: anotherNode data: anObject;
		  yourself
]

{ #category : #accessing }
TypEdge >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class == anObject class ifFalse: [ ^ false ].
	^ origin == anObject origin and: [ 
		  target == anObject target and: [ data = anObject data ] ]
]

{ #category : #accessing }
TypEdge >> asElementIn: aMondrian [

	| color border |
	color := Color gray alpha: 0.5.
	border := BlBorder builder
		          paint: color;
		          width: 2;
		          build.
	^ BlParabollaArcElement new
		  when: BlClickEvent do: [ :f | 
			  f consumed: true.
			  f target phlow spawnObject: self ];
		  layout: BlFrameLayout new;
		  addChild: (BrLabel new
				   constraintsDo: [ :c | 
					   c frame horizontal alignCenter.
					   c frame vertical alignCenter ];
				   beSmallSize;
				   aptitude: BrGlamorousLabelAptitude;
				   text: data asString asRopedText;
				   yourself);
		  zIndex: -1;
		  clipChildren: false;
		  curvatureFraction: 0.1;
		  border: border;
		  toHead: (BlArrowheadTriangle new
				   scale: 2;
				   border: border;
				   background: color;
				   yourself);
		  yourself
]

{ #category : #accessing }
TypEdge >> data [

	^ data
]

{ #category : #accessing }
TypEdge >> hash [

	^ ((self class hash bitXor: origin identityHash) bitXor:
		   target identityHash) bitXor: data hash
]

{ #category : #initialization }
TypEdge >> initializeOrigin: aNode target: anotherNode data: anObject [

	self assert: [ aNode typIsNode ].
	self assert: [ anotherNode typIsNode ].
	origin := aNode.
	target := anotherNode.
	data := anObject
]

{ #category : #accessing }
TypEdge >> origin [

	^ origin
]

{ #category : #accessing }
TypEdge >> printOn: aStream [

	data printOn: aStream
]

{ #category : #accessing }
TypEdge >> target [

	^ target
]
