Class {
	#name : #TypShaPhaStream,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaStream class >> shadowedClass [
	^ Stream class
]

{ #category : #accessing }
TypShaPhaStream >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]

{ #category : #shadow }
TypShaPhaStream >> mBinary380: aLookup [ 
	<typShaMethod: '<<'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' typAsVariableType resolveIn: a receiverType)} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaStream >> mNextPutAll: aLookup [ 
	<typShaMethod: 'nextPutAll:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a argumentTypes first ];
		yourself
]
