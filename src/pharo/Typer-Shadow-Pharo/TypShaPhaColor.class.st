Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaColor class >> mBlue: aLookup [ 
	<typShaMethod: 'blue'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaColor class >> mGreen: aLookup [ 
	<typShaMethod: 'green'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaColor class >> mOrange: aLookup [ 
	<typShaMethod: 'orange'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaColor class >> mPurple: aLookup [ 
	<typShaMethod: 'purple'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaColor class >> mRed: aLookup [ 
	<typShaMethod: 'red'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaColor class >> mVeryLightGray: aLookup [ 
	<typShaMethod: 'veryLightGray'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaColor class >> shadowedClass [
	^ Color class
]

{ #category : #shadow }
TypShaPhaColor >> mAlpha: aLookup [
	<typShaMethod: 'alpha:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]
