Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassMethodResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassVariableResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaMethodResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassInstanceVariable: aSymbol [
	^ self typStaClassVariableResolver resolves: self class typAsType -> aSymbol
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassMethod: aCompiledMethod [
	^ self typStaClassMethodResolver resolves: aCompiledMethod selector
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassVariable: aSymbol [
	^ self typStaVariableResolver resolves: self typAsType -> aSymbol
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesInstanceVariable: aSymbol [
	^ self typStaVariableResolver resolves: self typAsType -> aSymbol
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesMethod: aCompiledMethod [
	^ self typStaMethodResolver resolves: aCompiledMethod selector
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaVariableResolver [
	self flag: 'TODO'
]
