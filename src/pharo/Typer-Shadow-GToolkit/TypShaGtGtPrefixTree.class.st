Class {
	#name : #TypShaGtGtPrefixTree,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPrefixTree class >> shadowedClass [
	^ GtPrefixTree class
]

{ #category : #shadow }
TypShaGtGtPrefixTree >> mAddWeight: aLookup [ 
	<typShaMethod: 'add:weight:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ Number typAsType ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPrefixTree >> mWeightedFirstStartingWith: aLookup [ 
	<typShaMethod: 'weightedFirst:startingWith:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ String typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {String typAsType} ];
		yourself
]
