Class {
	#name : #TypShaGtGtPharoCompletionStrategy,
	#superclass : #TypShaShadow,
	#instVars : [
		'___maxItems'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy class >> shadowedClass [
	^ GtPharoCompletionStrategy class
]

{ #category : #accessing }
TypShaGtGtPharoCompletionStrategy >> ___actionsFor: _a at: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ GtPharoMethodNode typAsType ]
				ifFalse: [ Integer typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> GtCompletionAction typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoCompletionStrategy >> ___classOrMetaClass: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoCompletionStrategy >> ___index [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoCompletionStrategy >> ___nodeFor: _a in: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ GtPharoMethodNode typAsType ] ];
		resultType: [ :a :s :r | GtPharoProgramNode typAsType asNullable ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoCompletionStrategy >> ___selectorsForReceiver: _a matching: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Behavior typAsType ]
				ifFalse: [ String typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> String typAsType)} asDictionary ];
		yourself
]

{ #category : #initialization }
TypShaGtGtPharoCompletionStrategy >> initialize [
	super initialize.
	___maxItems := Integer typAsType
]
