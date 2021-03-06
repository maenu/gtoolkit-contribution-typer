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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(Collection typAsType
				copyWithParameters: {(aLookup receiver at: '@A')})}
]

{ #category : #shadow }
TypShaPhaStream >> mNextPutAll: aLookup [
	<typShaMethod: 'nextPutAll:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup arguments first
		arguments: {Collection typAsType}
]

{ #category : #accessing }
TypShaPhaStream >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
