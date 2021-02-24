Class {
	#name : #TypShaPhaStream,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaStream class >> shadowedClass [
	^ Stream class
]

{ #category : #shadow }
TypShaPhaStream >> mBinary380: aLookup [
	<typShaMethod: '<<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiverType at: '@A')})}
]

{ #category : #shadow }
TypShaPhaStream >> mNextPutAll: aLookup [ 
	<typShaMethod: 'nextPutAll:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a argumentTypes first ];
		yourself
]

{ #category : #accessing }
TypShaPhaStream >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
