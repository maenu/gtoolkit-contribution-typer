Class {
	#name : #TypCheIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Checker-Lookup'
}

{ #category : #accessing }
TypCheIndex >> initialize [
	super initialize.
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypPraMethodResolver new.
							TypShaMethodResolver new})	"no inf as used to check against other definitions"
]
