Class {
	#name : #TypGtNewRbAstMetaLink,
	#superclass : #MetaLink,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'class initialization' }
TypGtNewRbAstMetaLink class >> initialize [
	<script>
	GtSourceCoder
		withAllSubclassesDo: [ :e | 
			(e includesSelector: #newRbAST:)
				ifTrue: [ (e >> #newRbAST:) ast removeLink: self instance.
					(e >> #newRbAST:) ast link: self instance ] ]
]

{ #category : #accessing }
TypGtNewRbAstMetaLink class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #removing }
TypGtNewRbAstMetaLink class >> removeFromAll [
	<script>
	GtSourceCoder
		withAllSubclassesDo: [ :e | 
			(e includesSelector: #newRbAST:)
				ifTrue: [ (e >> #newRbAST:) ast removeLink: self instance ] ]
]

{ #category : #initialization }
TypGtNewRbAstMetaLink >> initialize [
	super initialize.
	self
		metaObject: [ :e | 
			e
				ifNotNil: [ :f | 
					f
						typTypeReset;
						typType ] ];
		selector: #value:;
		arguments: #(value)
]
