Extension { #name : #Stream }

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodBinaryPutOn: aLookup root: anotherLookup [
	<typShaMethod: '<<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodKeywordNextPutAll: aLookup root: anotherLookup [
	<typShaMethod: 'nextPutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup arguments first
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Stream class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType}
]
