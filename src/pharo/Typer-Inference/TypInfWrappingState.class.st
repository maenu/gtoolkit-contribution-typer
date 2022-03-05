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

	^ (self self: aState self super: aState super)
		  initializeState: aState;
		  yourself
]

{ #category : #accessing }
TypInfWrappingState class >> state: aState index: aDictionary [

	^ (self self: aState self super: aState super index: aDictionary)
		  initializeState: aState;
		  yourself
]

{ #category : #accessing }
TypInfWrappingState >> at: aNode [

	^ index at: aNode ifAbsent: [ state at: aNode ]
]

{ #category : #copying }
TypInfWrappingState >> copy [

	index size / state size < 0.2 ifTrue: [ 
		^ TypInfWrappingState state: state index: index copy ].
	^ TypInfState self: selfType super: superType index: self index
]

{ #category : #ui }
TypInfWrappingState >> gtItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ self index ];
		  view: #gtItemsFor:
]

{ #category : #accessing }
TypInfWrappingState >> index [

	^ state index copy
		  addAll: index;
		  yourself
]

{ #category : #'as yet unclassified' }
TypInfWrappingState >> initializeState: aState [

	state := aState
]

{ #category : #initialization }
TypInfWrappingState >> initializeState: aState index: aDictionary [

	self initializeSelf: state self super: state super index: aDictionary.
	state := aState
]

{ #category : #accessing }
TypInfWrappingState >> size [

	^ super size max: state size
]
