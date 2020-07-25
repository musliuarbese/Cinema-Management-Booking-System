/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Arbesa
 */
@Entity
@Table(name = "Ulset")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ulset.findAll", query = "SELECT u FROM Ulset u"),
    @NamedQuery(name = "Ulset.findByUlesejaID", query = "SELECT u FROM Ulset u WHERE u.ulesejaID = :ulesejaID"),
    @NamedQuery(name = "Ulset.findByEmriUlses", query = "SELECT u FROM Ulset u WHERE u.emriUlses = :emriUlses")})
public class Ulset implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "UlesejaID")
     @GeneratedValue(generator = "InvSeq")
    @SequenceGenerator(name = "InvSeq" , sequenceName = "INV_SEQ", allocationSize = 1)
    private Integer ulesejaID;
    @Column(name = "EmriUlses")
    private String emriUlses;
    @OneToMany(mappedBy = "ulesejaID")
    private Collection<Bileta> biletaCollection;
    @JoinColumn(name = "SallaID", referencedColumnName = "SallaID")
    @ManyToOne
    private Sallat sallaID;

    public Ulset() {
    }

    public Ulset(Integer ulesejaID) {
        this.ulesejaID = ulesejaID;
    }

    public Integer getUlesejaID() {
        return ulesejaID;
    }

    public void setUlesejaID(Integer ulesejaID) {
        this.ulesejaID = ulesejaID;
    }

    public String getEmriUlses() {
        return emriUlses;
    }

    public void setEmriUlses(String emriUlses) {
        this.emriUlses = emriUlses;
    }

    @XmlTransient
    public Collection<Bileta> getBiletaCollection() {
        return biletaCollection;
    }

    public void setBiletaCollection(Collection<Bileta> biletaCollection) {
        this.biletaCollection = biletaCollection;
    }

    public Sallat getSallaID() {
        return sallaID;
    }

    public void setSallaID(Sallat sallaID) {
        this.sallaID = sallaID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ulesejaID != null ? ulesejaID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ulset)) {
            return false;
        }
        Ulset other = (Ulset) object;
        if ((this.ulesejaID == null && other.ulesejaID != null) || (this.ulesejaID != null && !this.ulesejaID.equals(other.ulesejaID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BLL.Ulset[ ulesejaID=" + ulesejaID + " ]";
    }
    
}
