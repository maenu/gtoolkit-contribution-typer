Class {
	#name : #TypShaPhaMagnitude,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMagnitude class >> shadowedClass [
	^ Magnitude class
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary223: aLookup [ 
	<typShaMethod: '<='>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary225: aLookup [ 
	<typShaMethod: '>'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary226: aLookup [ 
	<typShaMethod: '<'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMagnitude >> mMax: aLookup [ 
	<typShaMethod: 'max:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]
