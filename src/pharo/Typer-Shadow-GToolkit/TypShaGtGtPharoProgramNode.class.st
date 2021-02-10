Class {
	#name : #TypShaGtGtPharoProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoProgramNode class >> shadowedClass [
	^ GtPharoProgramNode class
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___actionForSelector: _a startingWith: _b at: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ String typAsType ]
						ifFalse: [ Integer typAsType ] ] ];
		resultType: [ :a :s :r | GtCompletionAction typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___completionActionsFor: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtPharoCompletionStrategy typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> GtCompletionAction typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___source [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
