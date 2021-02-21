Class {
	#name : #TypShaGtGtDocument,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtDocument class >> shadowedClass [
	^ GtDocument class
]

{ #category : #shadow }
TypShaGtGtDocument >> mAsElement: aLookup [ 
	<typShaMethod: 'asElement'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlElement typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtDocument >> mStrategy: aLookup [ 
	<typShaMethod: 'strategy:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Gt2StorageStrategy typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtDocument >> mText: aLookup [ 
	<typShaMethod: 'text:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			BlRope typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
