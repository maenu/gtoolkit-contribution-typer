Class {
	#name : #TypResolver,
	#superclass : #TypNode,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypResolver class >> invalidateAll [

	<script>
	self allSubInstancesDo: #invalidate
]

{ #category : #resolving }
TypResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]
