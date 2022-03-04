Class {
	#name : #TypInfWrappingState,
	#superclass : #TypInfState,
	#instVars : [
		'state'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfWrappingState class >> state: aState [

	^ self new
		  initializeState: aState;
		  yourself
]

{ #category : #comparing }
TypInfWrappingState >> = anObject [

	^ super = anObject and: [ state = anObject ]
]

{ #category : #adding }
TypInfWrappingState >> addTo: aDictionary [

	super addTo: aDictionary.
	state addTo: aDictionary
]

{ #category : #accessing }
TypInfWrappingState >> at: aNode [

	^ index at: aNode ifAbsent: [ state at: aNode ]
]

{ #category : #copying }
TypInfWrappingState >> copy [

	| copy |
	index size / state size < 0.5 ifTrue: [ 
		copy := TypInfWrappingState  state: state.
		copy index addAll: index.
		^ copy ].
	copy := TypInfState self: selfType super: superType.
	self addTo: copy index.
	state addTo: copy index.
	^ copy
]

{ #category : #ui }
TypInfWrappingState >> gtItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ 
			  | flat |
			  flat := IdentityDictionary new.
			  self addTo: flat.
			  flat ];
		  view: #gtItemsFor:
]

{ #category : #initialization }
TypInfWrappingState >> initializeState: aState [

	state := aState.
	self initializeSelf: state self super: state super
]

{ #category : #accessing }
TypInfWrappingState >> size [

	^ super size max: state size
]
