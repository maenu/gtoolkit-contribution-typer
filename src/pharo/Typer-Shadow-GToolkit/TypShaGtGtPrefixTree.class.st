Class {
	#name : #TypShaGtGtPrefixTree,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPrefixTree class >> shadowedClass [
	^ GtPrefixTree class
]

{ #category : #accessing }
TypShaGtGtPrefixTree >> ___add: _a weight: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ Number typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPrefixTree >> ___weightedFirst: _a startingWith: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ String typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {('@A' -> String typAsType)} asOrderedDictionary ];
		yourself
]
